// ignore_for_file: use_build_context_synchronously
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_case_task/utilities/extension/media_query_extension.dart';
import 'package:study_case_task/utilities/extension/padding_extension.dart';
import 'package:study_case_task/view/filter/components/custom_filter_button.dart';

import '../../constant/color.dart';
import '../../utilities/provider/dropdown_menu_item_provider.dart';
import '../../view_model/filter_view_modal.dart';
import 'components/custom_muscle_drop_down_menu.dart';
import 'components/custom_type_drop_down_menu.dart';

class FilterView extends StatefulWidget {
  final String searchText;
  const FilterView({
    Key? key,
    required this.searchText,
  }) : super(key: key);

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends FilterViewModal {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Padding(
          padding: context.paddingLarge,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
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
                SizedBox(height: context.height * .2),
                Row(
                  children: [
                    Text(
                      "Muscle",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: ConstantAppColor.pureWhite),
                    ),
                    const Spacer(),
                    CustomMuscleDropDownButton(
                      dropDownMenuItemType: dropDownMenuItemType,
                      dropDownMenuItemMuscle: dropDownMenuItemMuscle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Type",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: ConstantAppColor.pureWhite),
                    ),
                    const Spacer(),
                    CustomTypeDropDownMenu(
                      dropDownMenuItemMuscle: dropDownMenuItemMuscle,
                      dropDownMenuItemType: dropDownMenuItemType,
                    ),
                  ],
                ),
                const Spacer(),
                CustomFilterButton(
                  text: "clean filter",
                  color: Colors.red,
                  function: () {
                    Provider.of<DropDownMenuItemProvider>(context,
                            listen: false)
                        .changeMenuItem("", "");
                  },
                ),
                CustomFilterButton(
                  text: "filter by",
                  color: Colors.green,
                  function: () async {
                    fetchWithFilter(
                        nameFilter: nameFilter,
                        muscleFilter: dropDownMenuItemMuscle,
                        typeFilter: dropDownMenuItemType);

                    // wait for tree to be built.
                    await Future.delayed(const Duration(seconds: 1));
                    Navigator.pop(context);
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
