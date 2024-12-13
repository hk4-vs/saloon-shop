import 'dart:convert';
import 'dart:developer';

import 'package:barber/data/models/user_register_model.dart';
import 'package:barber/view-model/user_view_model.dart';
import 'package:flutter/material.dart';

import '../data/models/user_model.dart';
import '../repository/auth_repositoiry.dart';

import '../utils/routes/route_arguments.dart';
import '../utils/routes/route_names.dart';
import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepositoiry();
  bool isLoading = false;
  bool isPasswordVisibla = true;
  bool isConfirmPasswordVisibla = false;
  bool get loading => isLoading;
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    UserViewModel userPrefrences = UserViewModel();
    try {
      setLoading(true);
      await _myRepo.loginApi(data).then((value) {
        setLoading(false);

        log("My values: ${value['access_token']}");

        UserModel loginResponseModel = UserModel(
          accessToken: value['access_token'],
          message: value['message'],
          user: User.fromJson(value['user']),
          userType: value['user_type'],
          status: value['status'],
        );
        userPrefrences.saveUser(loginResponseModel);

        Utils.toastMessage("Login Successful");

        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.userDashboardView, (route) => false);
      }).onError((error, stackTrace) {
        setLoading(false);
        Map<String, dynamic> errorMap = jsonDecode(error.toString());
        log("error log: $error");
        log("errorMap log: $errorMap");

        // log("error map log: $errorMap");

        Utils.flushBarErrorMessage(errorMap['message'].toString(), context);
      });
    } catch (e) {
      setLoading(false);
      log("exception log: $e");
      // ignore: use_build_context_synchronously
      Utils.flushBarErrorMessage("Something went wrong", context);
    }
  }

// This function for creating new user it's called Register function
  Future<void> registerApi(
      UserRegistrationModel data, BuildContext context) async {
    setLoading(true);
    try {
      log("data: ${data.toJson()}");
      await _myRepo.userRegisterApi(data.toJson()).then((value) {
        setLoading(false);
        log("response log: $value");
        data.verificationID = value['verification_id'].toString();

        Utils.toastMessage("send otp to ${data.email}");

        Navigator.pushNamed(context, RouteNames.userOtpVerificationView,
            arguments: {
              RouteArguments.userRegistrationModel: data,
            });
      }).onError((error, stackTrace) {
        setLoading(false);
        Map<String, dynamic> errorMap = jsonDecode(error.toString());
        log("error log: $error");
        log("errorMap log: $errorMap");

        // log("error map log: $errorMap");

        Utils.flushBarErrorMessage(errorMap['message'].toString(), context);
      });
    } catch (e) {
      setLoading(false);
      log("exceptionnnnnnnnn log: $e");
      // ignore: use_build_context_synchronously
      Utils.flushBarErrorMessage("Something went wrong", context);
    }
  }

  otpVerification(dynamic data, BuildContext context) async {
    setLoading(true);
    try {
      await _myRepo.verifyOtpApi(data).then((value) {
        setLoading(false);

        log("response log: $value");
        Utils.toastMessage("Register Successful Please Login.");
        Navigator.pushNamed(context, RouteNames.loginView);
      }).onError((error, stackTrace) {
        setLoading(false);
        Map errorMap = jsonDecode(error.toString());

        Utils.flushBarErrorMessage(errorMap['message'].toString(), context);
      });
    } catch (e) {
      setLoading(false);
      // Utils.flushBarErrorMessage(e.toString(), context);
    }
  }
// this fun are uncomment when i'm done it
//   Future<void> logoutApi(dynamic data, BuildContext context)async{

//  setLoading(true);
//     _myRepo.logOutApi(data).then((value) {
//       setLoading(false);

//       log("response log: $value");

//       Utils.toastMessage("Logout Successful.");
//       Navigator.popUntil(context, (route) => route.isFirst);
//       Navigator.pushReplacementNamed(context, RouteNames.login);
//     }).onError((error, stackTrace) {
//       setLoading(false);
//       log(error.toString());
//       Utils.flushBarErrorMessage(error.toString(), context);
//     });
//   }
}
