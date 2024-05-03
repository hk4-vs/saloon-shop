import 'dart:developer';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../resources/app-urls/app_urls.dart';

class AuthRepositoiry {
  final BaseApiServices _apiServices = NetworkApiService();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponses(AppUrls.login, data);
      log("response log: $response");
      return response;
    } catch (ex) {
      log("AuthRepositoiry loginApi exception log: $ex");
      rethrow;
    }
  }

  Future<dynamic> userRegisterApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponses(AppUrls.userRegister, data);
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> shopOwnerRegisterApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponses(AppUrls.shopRegister, data);
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> logOutApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponses(AppUrls.logout, data);
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> verifyOtpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponses(AppUrls.verifyOtp, data);
      return response;
    } catch (ex) {
      rethrow;
    }
  }

}
