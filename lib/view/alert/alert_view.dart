import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:study_case_task/model/exercise_model.dart';
import 'package:study_case_task/utilities/extension/padding_extension.dart';
import 'package:study_case_task/view/alert/components/dropdown_menu_item.dart';

import '../../constant/color.dart';
import '../../view_model/alert_view_modal.dart';
import '../home/components/custom_icon_button.dart';

class AlertView extends StatefulWidget {
  final String searchText;
  const AlertView({
    Key? key,
    required this.searchText,
  }) : super(key: key);

  @override
  State<AlertView> createState() => _AlertViewState();
}

class _AlertViewState extends AlertViewModal {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Padding(
          padding: context.paddingLarger,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: ConstantAppColor.pureWhite,
                      size: 27,
                    ),
                  ),
                ),
                DropdownButton(
                  iconEnabledColor: ConstantAppColor.pureWhite,
                  hint: const Text(
                    "Muscle",
                    style: TextStyle(color: ConstantAppColor.pureWhite),
                  ),
                  items: muscles,
                  onChanged: (value) {
                    muscleFilter = value;
                  },
                ),
                DropdownButton(
                  iconEnabledColor: ConstantAppColor.pureWhite,
                  hint: const Text(
                    "Type",
                    style: TextStyle(color: ConstantAppColor.pureWhite),
                  ),
                  items: types,
                  onChanged: (value) {
                    typeFilter = value;
                  },
                ),
                const Spacer(),
                CustomIconButton(
                  color: ConstantAppColor.naturalGreen,
                  icon: Icons.check,
                  splashRadius: 20,
                  size: 40,
                  function: () {
                    fetchWithFilter(
                        nameFilter: nameFilter,
                        muscleFilter: muscleFilter,
                        typeFilter: typeFilter);
                    //    Navigator.pushReplacementNamed(context, '/');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
