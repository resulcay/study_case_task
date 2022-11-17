import 'package:flutter/material.dart';
import 'package:study_case_task/constant/color.dart';
import 'package:study_case_task/utilities/extension/padding_extension.dart';

import '../../view_model/home_view_model.dart';
import '../filter/filter_view.dart';
import 'components/custom_icon_button.dart';
import 'components/custom_progress_indicator.dart';
import 'components/custom_text_field.dart';
import 'components/result_item_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantAppColor.indigoAccent,
      appBar: appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: context.paddingLow,
            child: Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, right: 8),
                    child: CustomTextField(controller: searchTextController),
                  ),
                ),
                CustomIconButton(
                  icon: Icons.search,
                  splashRadius: 20,
                  color: ConstantAppColor.darkerWhite,
                  function: () {
                    String nameFilter = searchTextController.text.trim();
                    fetch(
                        nameFilter: nameFilter,
                        muscleFilter: dropDownMenuItemMuscle,
                        typeFilter: dropDownMenuItemType);
                    // dismiss keyboard after search in case of active.
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
                CustomIconButton(
                  icon: Icons.filter_alt_outlined,
                  splashRadius: 22,
                  color: ConstantAppColor.darkerWhite,
                  function: () {
                    showDialog(
                      context: context,
                      useSafeArea: true,
                      builder: (BuildContext context) => FilterView(
                        searchText: searchTextController.text,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          isLoading
              ? const CustomProgressIndicator()
              : ResultItemBuilder(exercises: exercises)
        ],
      ),
    );
  }
}
