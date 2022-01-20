import 'package:flutter_api_test/core/services/services.dart';
import 'package:flutter_api_test/models/models.dart';

///class [ApiRepository] : helps to get data from services
class ApiRepository {
  final ApiService _apiService;

  const ApiRepository({required ApiService apiService}) : _apiService = apiService;

  /// fun [getAllNewsData] : getting all tech crunch news from api service
  Future<List<NewsModel>> getAllTechCrunchNewsList() async {
    return _apiService.getAllTechCrunchNewsList();
  }
}
