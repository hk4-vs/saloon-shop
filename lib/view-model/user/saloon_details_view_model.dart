import 'dart:developer';

import 'package:flutter/material.dart';

class SaloonDetailsViewModel extends ChangeNotifier {
  SaloonDetailsViewModel() {
    initFunc();
    getSelectedChooseTimeFunc();
  }
  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  set selectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }

  DateTime currentDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 15));

  // Create a list to store the dates
  List<DateTime> dates = [];

  initFunc() {
    for (DateTime date = currentDate;
        date.compareTo(endDate) <= 0;
        date = date.add(const Duration(days: 1))) {
      dates.add(date);
    }
  }

  // Choose Time
  String _selectedChoseTime = 'Morning';
  String get selectedChoseTime => _selectedChoseTime;
  set selectedChoseTime(String value) {
    _selectedChoseTime = value;
    notifyListeners();
    if (value == 'Morning') {
      selectedChoseTimeList = morningTimeList;
    } else if (value == 'Afternoon') {
      selectedChoseTimeList = afternoonTimeList;
    } else {
      selectedChoseTimeList = eveningTimeList;
    }

    selectedTime = selectedChoseTimeList[0];
    notifyListeners();
  }

  List<int> _selectedChoseTimeList = [];
  List<int> get selectedChoseTimeList => _selectedChoseTimeList;
  set selectedChoseTimeList(List<int> value) {
    _selectedChoseTimeList = value;
    notifyListeners();
  }

  List<int> morningTimeList = [7, 8, 9, 10, 11, 12];
  List<int> afternoonTimeList = [1, 2, 3, 4];
  List<int> eveningTimeList = [5, 6, 7, 8, 9, 10];

  getSelectedChooseTimeFunc() {
    DateTime now = DateTime.now();
    if (now.hour < 12) {
      selectedChoseTime = 'Morning';
    } else if (now.hour >= 12 && now.hour < 16) {
      selectedChoseTime = 'Afternoon';
    } else {
      selectedChoseTime = 'Evening';
    }
  }

  // Selected Time
  int _selectedTime = 0;
  int get selectedTime => _selectedTime;
  set selectedTime(int value) {
    _selectedTime = value;
    log("selectedTime: $_selectedTime");
    notifyListeners();
  }
}
