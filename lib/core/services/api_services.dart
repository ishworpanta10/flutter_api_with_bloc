import 'package:dio/dio.dart';
import 'package:flutter_api_test/core/constants/constants.dart';
import 'package:flutter_api_test/core/helper/dio_helper.dart';
import 'package:flutter_api_test/models/models.dart';

/// class [ApiService] for handling all api requests

class ApiService {
  ///FUN [getAllNewsData] : to get all news articles from api
  Future<List<NewsModel>> getAllTechCrunchNewsList() async {
    final Response response = await DioHelper.getData(path: techCrunchFullApi);
    final newsRawData = response.data['articles'] as List<dynamic>;
    final List<NewsModel> newsList = newsRawData.map((singleNews) => NewsModel.fromMap(singleNews)).toList();
    return newsList;
  }
}
