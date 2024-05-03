import 'package:flutter/material.dart';


class CreateOwnerProvider with ChangeNotifier {
  final int _activeStepIndex = 0;

  int get activeStepIndex => _activeStepIndex;
  
}