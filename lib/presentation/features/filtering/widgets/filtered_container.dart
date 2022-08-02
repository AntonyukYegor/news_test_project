import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_project/components/constants.dart';
import 'package:news_test_project/components/delayed_action.dart';
import 'package:news_test_project/domain/models/filters/articles/article_future_list_filter.dart';
import 'package:news_test_project/domain/models/filters/conditions/articles/article_title_contains_pattern_condition.dart';
import 'package:news_test_project/presentation/features/filtering/bloc/filtering_bloc.dart';
import 'package:news_test_project/presentation/features/filtering/bloc/filtering_event.dart';
import 'package:news_test_project/presentation/features/filtering/bloc/filtering_state.dart';
import 'package:news_test_project/presentation/features/sorting/widgets/sorted_container.dart';

class FilteredContainer extends StatefulWidget {
  const FilteredContainer({Key? key}) : super(key: key);

  @override
  State<FilteredContainer> createState() => _FilteredContainerState();
}

class _FilteredContainerState extends State<FilteredContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            onChanged: (e) {
              DelayedAction.run(
                () => context.read<FilteringBloc>().add(
                      ApplyFilterEvent(
                        filter: ArticleFutureListFilter.condition(
                          ArticleContainsPatternCondition(e),
                        ),
                      ),
                    ),
              );
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: AppConstants.inputRequestTitle,
            ),
          ),
        ),
        BlocBuilder<FilteringBloc, FilteringState>(
          buildWhen: (oldState, newState) =>
              oldState.filteredArticles != newState.filteredArticles ||
              oldState.filter != newState.filter,
          builder: (context, state) => SortedContainer(
            articles: state.filteredArticles,
          ),
        ),
      ],
    );
  }
}
