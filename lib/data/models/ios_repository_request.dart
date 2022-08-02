import 'package:news_test_project/data/models/base_articles_repository_request.dart';

class IOSRepositoryRequest extends BaseArticlesRepositoryRequest {
  static const _search = 'iOS';

  const IOSRepositoryRequest({
    required DateTime releaseDate,
  }) : super(
          releaseDate: releaseDate,
          search: _search,
        );
}
