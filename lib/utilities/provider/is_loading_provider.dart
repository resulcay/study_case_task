import 'package:flutter/material.dart';

class IsLoadingProvider extends ChangeNotifier {
  bool isLoading = false;

  changeLoadingState(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
