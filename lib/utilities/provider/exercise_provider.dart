import 'package:flutter/material.dart';

import '../../model/exercise_model.dart';

class ExerciseProvider with ChangeNotifier {
  List<ExerciseModel> exercises = [];

  changeExistList(List<ExerciseModel> list) {
    exercises = list;
    notifyListeners();
  }
}
