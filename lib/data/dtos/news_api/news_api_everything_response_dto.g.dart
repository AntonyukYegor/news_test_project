// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_everything_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsApiEverythingResponseDTO _$NewsApiEverythingResponseDTOFromJson(
        Map<String, dynamic> json) =>
    NewsApiEverythingResponseDTO(
      articles: (json['articles'] as List<dynamic>?)
              ?.map((e) => NewsApiEverythingResponseArticleDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$NewsApiEverythingResponseDTOToJson(
        NewsApiEverythingResponseDTO instance) =>
    <String, dynamic>{
      'articles': instance.articles,
    };
