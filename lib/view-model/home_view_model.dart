import 'package:barber/data/models/shops_model.dart';
import 'package:barber/utils/utils.dart';
import 'package:flutter/material.dart';

import '../repository/home_repository.dart';
import 'user_view_model.dart';

class HomeViewViewModel with ChangeNotifier {
  // HomeViewViewModel() {
  //   getShopList();
  // }
  UserViewModel userPrefrences = UserViewModel();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  final myRepo = HomeRepository();

  List<ShopsModel> _shopList = [];

  List<ShopsModel> get shopList => _shopList;

  set shopList(List<ShopsModel> value) {
    _shopList = value;
    notifyListeners();
  }

  Future<void> getShopList() async {
    isLoading = true;
    try {
      shopList = await myRepo
          .getListOfShops(userPrefrences.getUser()!.accessToken.toString());
      isLoading = false;
    } catch (e) {
      isLoading = false;
      Utils.toastMessage("Something went wrong");
      rethrow;
    }
  }
}
