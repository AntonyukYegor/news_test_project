import 'package:news_test_project/domain/models/articles_repository_request.dart';

class BaseArticlesRepositoryRequest implements ArticlesRepositoryRequest {
  const BaseArticlesRepositoryRequest({
    required DateTime releaseDate,
    required String search,
  })  : _releaseDate = releaseDate,
        _search = search;

  @override
  DateTime get releaseDate => _releaseDate;
  final DateTime _releaseDate;

  @override
  String get search => _search;
  final String _search;
}
