// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'client_service.dart';

class ClientServiceImpl implements ClientService {
  final Dio dio;
  ClientServiceImpl() : dio = Dio();

  @override
  Future get(String uri,
      {bool requiresAuth = false,
      String contentType = Headers.jsonContentType,  Map<String, dynamic>? queryParameters}) async {
    return await dio.get(uri,
        options: Options(
            extra: {'requiredAuth': requiresAuth},
            contentType: contentType,
            
            ), queryParameters: queryParameters);
  }

  @override
  Future post(String uri, List<Object> value,
      {bool requiresAuth = false,
      String contentType = Headers.jsonContentType}) async {
    return await dio.post(uri,
        data: value,
        options: Options(
            extra: {'requiredAuth': requiresAuth}, contentType: contentType));
  }

  @override
  Future delete(String uri,
      {bool requiresAuth = false,
      String contentType = Headers.jsonContentType}) async {
    return await dio.delete(uri,
        options: Options(
            extra: {'requiredAuth': requiresAuth}, contentType: contentType));
  }

  @override
  Future patch(String uri, Object value,
      {bool requiresAuth = false,
      String contentType = Headers.jsonContentType}) async {
    return await dio.patch(uri,
        data: value,
        options: Options(
            extra: {'requiredAuth': requiresAuth}, contentType: contentType));
  }
}
