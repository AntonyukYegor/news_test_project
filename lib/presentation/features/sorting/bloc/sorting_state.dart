import 'package:equatable/equatable.dart';
import 'package:news_test_project/domain/models/article.dart';
import 'package:news_test_project/domain/models/sorting/article_sorter_by_date.dart';
import 'package:news_test_project/domain/models/sorting/article_sorter_by_date_desc.dart';
import 'package:news_test_project/domain/models/sorting/sorter.dart';

class SortingState extends Equatable {
  final Sorter<Article> sorter;
  final bool isDescSorting;

  SortingState({
    required this.isDescSorting,
    Sorter<Article>? sorter,
  }) : sorter = sorter ??
            (isDescSorting ? ArticleSorterByDateDesc() : ArticleSorterByDate());

  SortingState copyWith({
    Sorter<Article>? sorter,
    bool? isDescSorting,
  }) =>
      SortingState(
        sorter: sorter ?? this.sorter,
        isDescSorting: isDescSorting ?? this.isDescSorting,
      );

  @override
  List<Object> get props => [
        isDescSorting,
      ];
}
