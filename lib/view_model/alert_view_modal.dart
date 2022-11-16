import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_case_task/utilities/provider/exercise_provider.dart';

import '../model/exercise_model.dart';
import '../service/dio_manager.dart';
import '../service/exercise_service.dart';
import '../view/alert/alert_view.dart';

abstract class AlertViewModal extends State<AlertView> with CustomDioMixin {
  late final IExerciseService exerciseService;
  late String nameFilter;
  String muscleFilter = '';
  String typeFilter = '';
  List<ExerciseModel> exercises = [];

  @override
  void didChangeDependencies() {
    exercises = Provider.of<ExerciseProvider>(context, listen: true).exercises;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    nameFilter = widget.searchText;
    exerciseService = ExerciseService(service);
  }

  Future<void> fetchWithFilter({
    String? nameFilter,
    String? muscleFilter,
    String? typeFilter,
  }) async {
    exercises = await exerciseService
            .fetchExerciseItems(context,
                nameFilter: nameFilter,
                muscleFilter: muscleFilter,
                typeFilter: typeFilter)
            .then((value) =>
                Provider.of<ExerciseProvider>(context, listen: false)
                    .changeExistList(value!)) ??
        [];
  }
}
