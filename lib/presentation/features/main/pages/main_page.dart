import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_project/components/constants.dart';
import 'package:news_test_project/domain/models/articles_repository_response.dart';
import 'package:news_test_project/presentation/common/widgets/empty.dart';
import 'package:news_test_project/presentation/common/widgets/error.dart';
import 'package:news_test_project/presentation/features/filtering/bloc/filtering_bloc.dart';
import 'package:news_test_project/presentation/features/filtering/widgets/filtered_container.dart';
import 'package:news_test_project/presentation/features/main/bloc/main_bloc.dart';
import 'package:news_test_project/presentation/features/main/bloc/main_event.dart';
import 'package:news_test_project/presentation/features/main/bloc/main_state.dart';
import 'package:news_test_project/presentation/features/sorting/widgets/sort_direction_switcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String navigationPath = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void didChangeDependencies() {
    context.read<MainBloc>().add(LoadDataEvent());
    super.didChangeDependencies();
  }

  bool order = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppConstants.mainPageTitle),
        leading: const SortDirectionSwitcher(),
        actions: [
          IconButton(
              onPressed: () async {
                final bloc = context.read<MainBloc>();
                final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: bloc.state.publishDate,
                    firstDate: AppConstants.newsFirstDate,
                    lastDate: DateTime.now().toUtc());
                if (picked != null) {
                  bloc.add(PublishDateChangedEvent(date: picked));
                }
              },
              icon: const Icon(Icons.calendar_month))
        ],
      ),
      body: BlocBuilder<MainBloc, MainState>(
        buildWhen: (oldState, newState) => oldState.data != newState.data,
        builder: (context, state) {
          return FutureBuilder<ArticlesRepositoryResponse>(
            future: state.data,
            builder: (BuildContext context,
                AsyncSnapshot<ArticlesRepositoryResponse?> data) {
              return data.connectionState != ConnectionState.done
                  ? const Center(
                      child: Center(child: CircularProgressIndicator()))
                  : data.hasData
                      ? data.data?.articles.isNotEmpty == true
                          ? BlocProvider<FilteringBloc>(
                              lazy: false,
                              create: (context) => FilteringBloc(
                                sourceArticles: data.data?.articles ?? [],
                              ),
                              child: const FilteredContainer(),
                            )
                          : const Empty()
                      : const Error();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<MainBloc>().add(LoadDataEvent());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
