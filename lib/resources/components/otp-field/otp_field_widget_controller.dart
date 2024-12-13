import 'package:flutter/material.dart';

class OtpInputController {
  final List<TextEditingController> _textControllers = [];

  void initializeControllers() {
    for (int i = 0; i < 6; i++) {
      _textControllers.add(TextEditingController());
    }
  }

  void disposeControllers() {
    for (var controller in _textControllers) {
      controller.dispose();
    }
  }

  String getOtp() {
    String otp = '';
    for (var controller in _textControllers) {
      otp += controller.text;
    }
    return otp;
  }

  List<TextEditingController> getControllers() {
    return _textControllers;
  }
}
