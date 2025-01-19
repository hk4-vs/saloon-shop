// ignore_for_file: unused_field

import 'dart:developer';

import '../data/models/shops_model.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../resources/app-urls/app_urls.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  Future<List<ShopsModel>> getListOfShops(String token) async {
    try {
      dynamic response = await _apiServices.getGetApiResponses(
          AppUrls.getShopsList,
          {"Accept": "application/json", "Authorization": "Bearer $token"});
      List list = response;
      List<ShopsModel> shopsList =
          list.map((e) => ShopsModel.fromJson(e)).toList();

      // response = ShopsModel.fromJson(response);
      log("shop list log: ${response}");
      return shopsList;
    } catch (ex) {
      rethrow;
    }
  }

  // Future<NewsModel> getSearchQueryOfNews(String query) async {
  //   String queryUrl =
  //       "${AppUrls.newsBaseUrl}/everything?q=$query&sortBy=publishedAt&apiKey=${AppUrls.newsApiKey}";
  //   log("queryUrl: $queryUrl");
  //   try {
  //     dynamic response = await _apiServices.getGetApiResponses(queryUrl);
  //     response = NewsModel.fromJson(response);
  //     log("hedlines log: ${response.articles}");
  //     return response;
  //   } catch (ex) {
  //     rethrow;
  //   }
  // }
}
