import 'package:flutter/foundation.dart';
import 'package:news_test_project/domain/models/filters/conditions/abstract_condition.dart';

class AggregateCondition<T> implements AbstractCondition<T> {
  @protected
  final Iterable<AbstractCondition<T>> conditions;

  AggregateCondition.single(AbstractCondition<T> condition) : this([condition]);

  AggregateCondition(this.conditions);

  @override
  bool check(T source) {
    return conditions.every((element) => element.check(source));
  }
}
