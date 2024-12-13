import 'dart:async';
import 'package:flutter/material.dart';

class CountdownProvider extends ChangeNotifier {
  late int _countdown;
  late Timer _timer;

  CountdownProvider(int initialValue) {
    _countdown = initialValue;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        _countdown--;
        notifyListeners();
      } else {
        _timer.cancel();
      }
    });
  }

  int get countdown => _countdown;

  void setCountdown(int value) {
    _countdown = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
