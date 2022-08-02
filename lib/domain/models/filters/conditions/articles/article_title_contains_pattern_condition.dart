import 'package:news_test_project/domain/models/article.dart';
import 'package:news_test_project/domain/models/filters/conditions/abstract_condition.dart';

class ArticleContainsPatternCondition implements AbstractCondition<Article> {
  final String pattern;

  ArticleContainsPatternCondition(this.pattern);

  @override
  bool check(Article source) {
    return source.title.toLowerCase().contains(pattern.toLowerCase());
  }
}
