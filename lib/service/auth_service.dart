import 'package:dio/dio.dart';
import 'package:e_commers/model/detail_responce.dart';

class ApiAuthProvider {
  final Dio _dio = new Dio();

  Future<DetailResponse> getProducts() async {
    try {
      final response =
          await _dio.get("https://stark-spire-93433.herokuapp.com/json");
      return DetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print(error);
    }
  }
}
