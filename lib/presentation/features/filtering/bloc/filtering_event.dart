import 'package:equatable/equatable.dart';
import 'package:news_test_project/domain/models/article.dart';
import 'package:news_test_project/domain/models/filters/abstract_filter.dart';

abstract class FilteringEvent extends Equatable {
  const FilteringEvent();

  @override
  List<Object> get props => [];
}

class ApplyFilterEvent extends FilteringEvent {
  final AbstractFilter<Future<List<Article>>> filter;

  const ApplyFilterEvent({required this.filter});

  @override
  List<Object> get props => [filter];
}
