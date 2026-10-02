import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:islami_app/core/api/api_consumer.dart';
import 'package:islami_app/core/api/errors/handel_dio_exception.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer({required this.dio}) {
    dio.options.connectTimeout = const Duration(seconds: 60);
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        request: true,
      ),
    );
  }
  @override
  Future<dynamic> delete({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    } catch (e) {
      log('dio consumer delete ==== ${e.toString()}');
    }
  }

  @override
  Future<dynamic> get({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    } catch (e) {
      log('dio consumer get ==== ${e.toString()}');
    }
  }

  @override
  Future<dynamic> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    } catch (e) {
      log('dio consumer post ==== ${e.toString()}');
    }
  }

  @override
  Future<dynamic> put({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    } catch (e) {
      log('dio consumer put ==== ${e.toString()}');
    }
  }
}
