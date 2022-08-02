import 'package:news_test_project/domain/models/filters/conditions/abstract_condition.dart';

class LambdaCondition<T> implements AbstractCondition<T> {
  final bool Function(T) _conditionFunction;

  LambdaCondition(this._conditionFunction);

  @override
  bool check(T source) {
    return _conditionFunction(source);
  }
}
