import 'package:news_test_project/domain/models/article.dart';
import 'package:news_test_project/domain/models/filters/abstract_filter.dart';
import 'package:news_test_project/domain/models/filters/conditions/abstract_condition.dart';
import 'package:news_test_project/domain/models/filters/conditions/aggregate_condition.dart';
import 'package:news_test_project/domain/models/filters/conditions/any_aggregate_condition.dart';
import 'package:news_test_project/domain/models/filters/future_list/condition_future_list_filter.dart';
import 'package:news_test_project/domain/models/filters/future_list/future_list_filter.dart';

class ArticleFutureListFilter extends FutureListFilter<Article> {
  ArticleFutureListFilter.empty() : super.empty();

  ArticleFutureListFilter.condition(AbstractCondition<Article> condition)
      : super([ConditionFutureListFilter(condition)]);

  ArticleFutureListFilter.everyConditions(
      Iterable<AbstractCondition<Article>> conditions)
      : this.condition(AggregateCondition(conditions));

  ArticleFutureListFilter.anyCondition(
      Iterable<AbstractCondition<Article>> conditions)
      : this.condition(AnyAggregateCondition(conditions));

  ArticleFutureListFilter(
      Iterable<AbstractFilter<Future<List<Article>>>> filters)
      : super(filters);
}
