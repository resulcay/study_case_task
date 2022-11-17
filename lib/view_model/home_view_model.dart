import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_case_task/model/exercise_model.dart';
import 'package:study_case_task/service/exercise_service.dart';
import 'package:study_case_task/utilities/provider/exercise_provider.dart';

import '../constant/color.dart';
import '../constant/text.dart';
import '../service/dio_manager.dart';

import '../utilities/provider/dropdown_menu_item_provider.dart';
import '../utilities/provider/is_loading_provider.dart';
import '../view/home/home_view.dart';

abstract class HomeViewModel extends State<HomeView> with CustomDioMixin {
  late final IExerciseService exerciseService;
  late bool isLoading;
  late String dropDownMenuItemMuscle;
  late String dropDownMenuItemType;
  List<ExerciseModel> exercises = [];
  TextEditingController searchTextController = TextEditingController();

  @override
  void didChangeDependencies() {
    isLoading = Provider.of<IsLoadingProvider>(context, listen: true).isLoading;
    exercises = Provider.of<ExerciseProvider>(context, listen: true).exercises;
    dropDownMenuItemMuscle =
        Provider.of<DropDownMenuItemProvider>(context, listen: true)
            .dropDownMenuItemMuscle;
    dropDownMenuItemType =
        Provider.of<DropDownMenuItemProvider>(context, listen: true)
            .dropDownMenuItemType;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    exerciseService = ExerciseService(service);
    fetch();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  Future<void> fetch({
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

  AppBar appBar() {
    return AppBar(
      title: Text(
        ConstantAppText.appBarSearchText,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: ConstantAppColor.pureWhite,
            ),
      ),
      centerTitle: true,
    );
  }
}
