abstract class ApiConsumer {
  Future<dynamic> get({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

  Future<dynamic> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

  Future<dynamic> put({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

  Future<dynamic> delete({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
}
