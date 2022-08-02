import 'package:equatable/equatable.dart';
import 'package:news_test_project/domain/models/articles_repository_response.dart';

class MainState extends Equatable {
  final Future<ArticlesRepositoryResponse>? data;
  final DateTime publishDate;

  const MainState({
    this.data,
    required this.publishDate,
  });

  MainState copyWith({
    Future<ArticlesRepositoryResponse>? data,
    DateTime? publishDate,
  }) =>
      MainState(
        data: data ?? this.data,
        publishDate: publishDate ?? this.publishDate,
      );

  @override
  List<Object> get props => [data ?? 0, publishDate];
}
