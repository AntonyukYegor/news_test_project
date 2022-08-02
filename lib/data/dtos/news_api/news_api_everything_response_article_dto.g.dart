// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_everything_response_article_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsApiEverythingResponseArticleDTO
    _$NewsApiEverythingResponseArticleDTOFromJson(Map<String, dynamic> json) =>
        NewsApiEverythingResponseArticleDTO(
          author: json['author'] as String? ?? '',
          title: json['title'] as String? ?? '',
          url: json['url'] as String? ?? '',
          urlToImage: json['urlToImage'] as String? ?? '',
          publishedAt: json['publishedAt'] as String,
        );

Map<String, dynamic> _$NewsApiEverythingResponseArticleDTOToJson(
        NewsApiEverythingResponseArticleDTO instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
    };
