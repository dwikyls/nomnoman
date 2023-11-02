import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nomnoman/utils/constants.dart';
import 'package:nomnoman/utils/dependency_injection.dart';

final Dio dio = Dio();
final _storage = locator.get<FlutterSecureStorage>();
const Map<String, dynamic> options = {};

Future<Response> getWithAuth(
  path, {
  Map<String, dynamic> options = options,
}) async {
  final token = await getAccessToken();
  final requestOptions = RequestOptions(
      baseUrl: driveBaseUrl,
      path: path,
      method: options['method'],
      headers: {
        ...options['headers'],
        "Authorization": "Bearer $token",
      });

  return await dio.fetch(requestOptions);
}

Future<void> putAccessToken(String? token) async {
  await _storage.write(key: "token", value: token);
}

Future<String?> getAccessToken() async {
  return await _storage.read(key: 'token');
}
