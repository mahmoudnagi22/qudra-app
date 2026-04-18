import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;
  ApiServices(this.dio);

  Future<Response> getData({
    String? token,
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: token != null
          ? Options(headers: {'Authorization': 'Bearer $token'})
          : null,
    );
  }

  Future<Response> postData({
    required String endPoint,
    required dynamic data,
    required bool isFormData,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.post(
      endPoint,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
      options: token != null
          ? Options(headers: {'Authorization': 'Bearer $token'})
          : null,
    );
  }

  Future<Response> putData({
    required String endPoint,
    required dynamic data,
    required bool isFormData,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.put(
      endPoint,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
  }

  Future<Response> patchData({
    required String endPoint,
    required dynamic data,
    required bool isFormData,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.patch(
      endPoint,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
  }

  Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.delete(
      endPoint,
      queryParameters: queryParameters,
    );
  }
}
