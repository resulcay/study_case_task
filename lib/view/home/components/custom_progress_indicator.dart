import 'package:flutter/material.dart';

import '../../../constant/color.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: Center(
      child: CircularProgressIndicator(
        color: ConstantAppColor.pureWhite,
      ),
    ));
  }
}
