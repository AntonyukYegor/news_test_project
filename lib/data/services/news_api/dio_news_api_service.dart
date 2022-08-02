import 'package:dio/dio.dart';
import 'package:news_test_project/data/dtos/news_api/news_api_everything_response_dto.dart';
import 'package:news_test_project/data/mappers/date_time_to_short_string.dart';
import 'package:news_test_project/data/repositories/dio/interceptors/dio_error_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioNewsApiService {
  late final Dio _dio = Dio()
    ..interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
      ErrorInterceptor(_onErrorHandler),
    ]);

  final Function(String, String) _onErrorHandler;

  static const _baseURL = 'https://newsapi.org/v2/everything?apiKey=$_apiKey';
  static const _apiKey = '0d18950e9e834be9882bcef720c2802a';

  DioNewsApiService({required Function(String, String) onErrorHandler})
      : _onErrorHandler = onErrorHandler;

  Future<NewsApiEverythingResponseDTO> searchRepositories({
    required String searchQuery,
    required DateTime publishDate,
  }) async {
    final Response<dynamic> response = await _dio.get<dynamic>(
      _baseURL,
      queryParameters: <String, dynamic>{
        'q': searchQuery,
        'from': publishDate.toShort(),
      },
    );
    return NewsApiEverythingResponseDTO.fromJson(response.data);
  }
}
