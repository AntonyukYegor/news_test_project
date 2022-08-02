import 'package:news_test_project/domain/models/article.dart';
import 'package:news_test_project/domain/models/sorting/sorter.dart';

class ArticleSorterByDate implements Sorter<Article> {
  @override
  List<Article> sort(Iterable<Article> source) {
    return source.toList()
      ..sort(
        (a, b) => a.releaseDate.compareTo(b.releaseDate),
      );
  }
}
