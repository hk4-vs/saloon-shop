import 'package:barber/data/models/hive_models/user_hive_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../data/models/user_model.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel userModel) async {
    final HiveLoginResponse loginResponse = HiveLoginResponse(
      message: userModel.message.toString(),
      user: HiveUser(
        id: userModel.user!.id!.toInt(),
        name: userModel.user!.name.toString(),
        email: userModel.user!.email.toString(),
        emailVerifiedAt: userModel.user!.emailVerifiedAt.toString(),
      ),
      userType: userModel.userType.toString(),
      accessToken: userModel.accessToken.toString(),
      status: userModel.status ?? false,
    );
    Box box = await Hive.openBox('user');
    box.put('user', loginResponse);
    notifyListeners();
    return true;
  }

  HiveLoginResponse? getUser() {
    var user = Hive.box('user').get('user');
    return user;
  }

  // Future<bool> updateUserToSaveData(String field, String data) async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();

  //   preferences.setString(field, data);

  //   notifyListeners();
  //   return true;
  // }

  Future<bool> removeData() async {
    Hive.box('user').delete('user');
    return true;
  }
}
