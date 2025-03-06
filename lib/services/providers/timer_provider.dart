import 'package:flutter/material.dart';

// Anti message spam timer. 15 secs is enough, to avoid OpenAI limits.
class TimerProvider extends ChangeNotifier{
  int _seconds = 15;
  bool _isRunning = false;

  int get seconds => _seconds;
  bool get isRunning => _isRunning;

  void startTimer() {
    _isRunning = true;
    countdown();
  }

  void countdown() {
    if(_seconds > 0 && _isRunning) {
      Future.delayed(Duration(seconds: 1), () {
        _seconds--;
        notifyListeners();
        countdown();
      });
    } else {
      _isRunning = false;
      _seconds = 15;
    }
  }
}