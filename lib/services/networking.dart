import 'package:dio/dio.dart';
import 'dart:convert';

class NetworkHelper {
  static Future postRequest(String url,[options, file]) async {
    Dio dio = new Dio();
    Map<String, dynamic> data = {...?options};

    try {
      Response response = await dio.post(url, data: data);
      return response.data;
    } on DioError catch (e) {
      // Do whatever
    }
  }

  static Future getRequest(String url,[options, file]) async {
    Dio dio = new Dio();
    Map<String, dynamic> data = {...?options};

    try {
      Response response = await dio.get(url);
      return response.data;

    } on DioError catch (e) {
      // Do whatever
    }
  }
}

/*Future<List<String>> getHTTP(String url) async {
  try {
    Response response = await dio.get(url);
    return json.decode(response.data);
  } on DioError catch (e) {
    // Do whatever
  }
}*/


/*
void putHTTP(String url, Map data) async {
  try {
    Response response = await dio.put(url, data: data);
    // Do whatever
  } on DioError catch (e) {
    // Do whatever
  }*/