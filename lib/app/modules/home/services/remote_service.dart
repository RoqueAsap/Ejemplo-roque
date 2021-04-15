import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ejemplo_lunes/app/config/error/exceptions.dart';
import 'package:ejemplo_lunes/app/modules/home/models/response_model.dart';

class RemoteService {
  Dio dio;
  RemoteService({
    required this.dio,
  });

  Future<ResponseModel> getPost() async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/posts');
      // print(response.data[0]);
      final modelo =
          ResponseModel.fromJson(response.data[0] as Map<String, dynamic>);
      print(modelo.toString());
      return modelo;
    } on DioError catch (err) {
      if (err.error == SocketException) {
        throw NoInternetException();
      }
      final statusCode = err.response!.statusCode;
      //Aqui van las otras posibles fallos
    }
    throw Exception();
  }
}
