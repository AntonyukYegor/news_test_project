import 'package:news_test_project/domain/models/filters/conditions/abstract_condition.dart';

class AllConditionedCondition<T> implements AbstractCondition<T> {
  @override
  bool check(T source) {
    return true;
  }
}
