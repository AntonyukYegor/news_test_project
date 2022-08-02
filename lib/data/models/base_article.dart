import 'package:news_test_project/domain/models/article.dart';

class BaseArticle implements Article {
  const BaseArticle({
    required String owner,
    required String picture,
    required DateTime releaseDate,
    required String sourceUrl,
    required String title,
  })  : _owner = owner,
        _picture = picture,
        _releaseDate = releaseDate,
        _sourceUrl = sourceUrl,
        _title = title;

  @override
  String get owner => _owner;
  final String _owner;

  @override
  String get picture => _picture;
  final String _picture;

  @override
  DateTime get releaseDate => _releaseDate;
  final DateTime _releaseDate;

  @override
  String get sourceUrl => _sourceUrl;
  final String _sourceUrl;

  @override
  String get title => _title;
  final String _title;
}
