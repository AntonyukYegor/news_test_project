import 'package:news_test_project/domain/models/article.dart';
import 'package:news_test_project/domain/models/sorting/sorter.dart';

class ArticleSorterByDateDesc implements Sorter<Article> {
  @override
  List<Article> sort(Iterable<Article> source) {
    return source.toList()
      ..sort(
        (a, b) => b.releaseDate.compareTo(a.releaseDate),
      );
  }
}
