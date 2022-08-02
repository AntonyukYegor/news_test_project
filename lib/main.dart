import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_project/blocs/error_bloc/error_bloc.dart';
import 'package:news_test_project/blocs/error_bloc/error_event.dart';
import 'package:news_test_project/components/constants.dart';
import 'package:news_test_project/data/repositories/dio/dio_news_api_repository.dart';
import 'package:news_test_project/data/services/news_api/dio_news_api_service.dart';
import 'package:news_test_project/domain/repositories/articles_repository.dart';
import 'package:news_test_project/presentation/features/details/models/article_details_model.dart';
import 'package:news_test_project/presentation/features/main/bloc/main_bloc.dart';
import 'package:news_test_project/presentation/features/main/pages/main_page.dart';
import 'package:news_test_project/presentation/features/no_found/pages/not_found_page.dart';
import 'package:news_test_project/presentation/features/sorting/bloc/sorting_bloc.dart';

import 'presentation/features/details/pages/details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appTitle,
      initialRoute: MainPage.navigationPath,
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == MainPage.navigationPath) {
          return MaterialPageRoute(
            builder: (_) {
              return BlocProvider<ErrorBloc>(
                lazy: false,
                create: (context) => ErrorBloc(context: context),
                child: RepositoryProvider<ArticlesRepository>(
                  lazy: false,
                  create: (context) => DioArticlesRepository(
                    apiService: DioNewsApiService(
                      onErrorHandler: (String code, String message) {
                        context.read<ErrorBloc>().add(
                              ShowDialogEvent(
                                title: code,
                                message: message,
                              ),
                            );
                      },
                    ),
                  ),
                  child: BlocProvider<SortingBloc>(
                    lazy: false,
                    create: (context) => SortingBloc(
                      sortByDesc: false,
                    ),
                    child: BlocProvider<MainBloc>(
                      lazy: false,
                      create: (context) => MainBloc(
                        repository: context.read<ArticlesRepository>(),
                      ),
                      child: const MainPage(),
                    ),
                  ),
                ),
              );
            },
          );
        }

        if (settings.name == DetailsPage.navigationPath) {
          final ArticleDetailsModel model =
              settings.arguments as ArticleDetailsModel;
          return MaterialPageRoute(
            builder: (_) {
              return DetailsPage(model: model);
            },
          );
        }

        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
      },
    );
  }
}
