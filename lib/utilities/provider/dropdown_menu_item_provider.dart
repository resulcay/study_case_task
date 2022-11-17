import 'package:flutter/material.dart';

class DropDownMenuItemProvider with ChangeNotifier {
  String dropDownMenuItemMuscle = "";
  String dropDownMenuItemType = "";

  changeMenuItem(String item1, String item2) {
    dropDownMenuItemMuscle = item1;
    notifyListeners();
    dropDownMenuItemType = item2;
    notifyListeners();
  }
}
