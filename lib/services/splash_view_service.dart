import 'dart:developer';

import 'package:barber/utils/routes/route_names.dart';
import 'package:flutter/material.dart';

import '../view-model/user_view_model.dart';

class SplashViewService with ChangeNotifier {
  isAlradyLogin(BuildContext context) async {
    UserViewModel userViewModel = UserViewModel();
    // userViewModel.removeData();
    var value = userViewModel.getUser();
    if (value != null) {
      log("user log: $value");
      log("user email: ${value.user.email}");
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.userDashboardView, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.loginView, (route) => false);
    }
  }
}
