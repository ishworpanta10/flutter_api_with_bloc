import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_test/core/constants/url_constants.dart';
import 'package:flutter_api_test/models/models.dart';

class DioHelper {
  static Dio _dio = Dio();

  /// FUN  [init] for initializing api base url
  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  /// FUN [getData] : to get data with GET method with a requested path and query
  static Future<Response> getData({required String path, Map<String, dynamic>? query}) async {
    try {
      final Response response = await _dio.get(path, queryParameters: query);
      return response;
    } on DioError catch (dioErr) {
      if (dioErr.error.runtimeType == SocketException) {
        throw const Failure(message: 'No Internet Connection !');
      }
      throw Failure(
        message: dioErr.response?.statusMessage ?? 'Error getting data',
        code: dioErr.response?.statusCode.toString() ?? '',
      );
    } catch (err) {
      debugPrint("Error during getting data (url : $path)  :$err");
      throw const Failure(message: 'Something went Wrong !!!');
    }
  }
}
