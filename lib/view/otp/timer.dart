import 'package:flutter/material.dart';

class TimerInfo extends ChangeNotifier{

  int _remaining_time = 30;

  int getRemainingTime()
  {
    return _remaining_time;
  }

  updateRemainingTime()
  {
    _remaining_time--;
    notifyListeners();
  }
}