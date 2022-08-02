import 'package:equatable/equatable.dart';
import 'package:news_test_project/domain/models/article.dart';
import 'package:news_test_project/domain/models/filters/abstract_filter.dart';
import 'package:news_test_project/domain/models/filters/articles/article_future_list_filter.dart';

class FilteringState extends Equatable {
  final List<Article> filteredArticles;
  final List<Article> sourceArticles;

  final AbstractFilter<Future<List<Article>>> filter;

  FilteringState({
    List<Article>? filteredArticles,
    List<Article>? sourceArticles,
    AbstractFilter<Future<List<Article>>>? filter,
  })  : filter = filter ?? ArticleFutureListFilter.empty(),
        filteredArticles = filteredArticles ?? [],
        sourceArticles = sourceArticles ?? [];

  FilteringState copyWith({
    List<Article>? filteredArticles,
    List<Article>? sourceArticles,
    AbstractFilter<Future<List<Article>>>? filter,
  }) =>
      FilteringState(
        filteredArticles: filteredArticles ?? this.filteredArticles,
        filter: filter ?? this.filter,
        sourceArticles: sourceArticles ?? this.sourceArticles,
      );

  @override
  List<Object> get props => [
        sourceArticles,
        filteredArticles,
        filter,
      ];
}
