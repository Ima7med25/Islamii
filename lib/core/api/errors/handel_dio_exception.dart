import 'package:dio/dio.dart';
import 'package:islami_app/core/api/errors/error_model.dart';
import 'package:islami_app/core/api/errors/exception.dart';

void handelDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(ErrorModel(error: e.response!.data['message']));
    case DioExceptionType.sendTimeout:
      throw ServerException(ErrorModel(error: e.response!.data['message']));
    case DioExceptionType.receiveTimeout:
      throw ServerException(ErrorModel(error: e.response!.data['message']));
    case DioExceptionType.badCertificate:
      throw ServerException(ErrorModel(error: e.response!.data['message']));
    case DioExceptionType.cancel:
      throw ServerException(ErrorModel(error: e.response!.data['message']));
    case DioExceptionType.connectionError:
      throw ServerException(ErrorModel(error: e.response!.data['message']));
    case DioExceptionType.unknown:
      throw ServerException(ErrorModel(error: e.response!.data['message']));
    case DioExceptionType.badResponse:
      switch (e.response!.statusCode) {
        case 400:
          throw ServerException(ErrorModel(error: e.response!.data['message']));
        case 401:
          throw ServerException(ErrorModel(error: e.response!.data['message']));
        case 403:
          throw ServerException(ErrorModel(error: e.response!.data['message']));
        case 404:
          throw ServerException(ErrorModel(error: e.response!.data['message']));
        case 422:
          throw ServerException(ErrorModel(error: e.response!.data['message']));
        case 500:
          throw ServerException(ErrorModel(error: e.response!.data['message']));
      }
  }
}
