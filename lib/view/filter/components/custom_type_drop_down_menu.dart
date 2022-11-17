import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/color.dart';
import '../../../utilities/provider/dropdown_menu_item_provider.dart';
import 'dropdown_menu_item.dart';

class CustomTypeDropDownMenu extends StatelessWidget {
  const CustomTypeDropDownMenu({
    Key? key,
    required this.dropDownMenuItemMuscle,
    required this.dropDownMenuItemType,
  }) : super(key: key);

  final String dropDownMenuItemMuscle;
  final String dropDownMenuItemType;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      alignment: Alignment.centerRight,
      style: Theme.of(context).textTheme.headline6!.copyWith(
            color: Colors.black,
          ),
      onChanged: (changedValue) {
        Provider.of<DropDownMenuItemProvider>(context, listen: false)
            .changeMenuItem(dropDownMenuItemMuscle, changedValue!);
      },
      value: dropDownMenuItemType,
      iconEnabledColor: ConstantAppColor.pureWhite,
      items: types.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(
            value,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 18,
                  color: Colors.black.withOpacity(.6),
                ),
          ),
        );
      }).toList(),
    );
  }
}
