import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/color.dart';
import '../../../utilities/provider/dropdown_menu_item_provider.dart';
import 'dropdown_menu_item.dart';

class CustomMuscleDropDownButton extends StatelessWidget {
  const CustomMuscleDropDownButton({
    Key? key,
    required this.dropDownMenuItemType,
    required this.dropDownMenuItemMuscle,
  }) : super(key: key);

  final String dropDownMenuItemType;
  final String dropDownMenuItemMuscle;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      alignment: Alignment.centerRight,
      onChanged: (changedValue) {
        Provider.of<DropDownMenuItemProvider>(context, listen: false)
            .changeMenuItem(changedValue!, dropDownMenuItemType);
      },
      value: dropDownMenuItemMuscle,
      iconEnabledColor: ConstantAppColor.pureWhite,
      items: muscles.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.6),
                  )),
        );
      }).toList(),
    );
  }
}
