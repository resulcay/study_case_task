import 'package:flutter/material.dart';
import 'package:study_case_task/utilities/extension/padding_extension.dart';

import '../../../constant/color.dart';
import '../../../constant/text.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: false,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: ConstantAppText.textFieldHintText,
        hintStyle: const TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        contentPadding: context.paddingLow,
        fillColor: ConstantAppColor.pureWhite,
      ),
    );
  }
}
