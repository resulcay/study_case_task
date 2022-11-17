import 'package:flutter/material.dart';

class BottomSheetTextSection extends StatelessWidget {
  const BottomSheetTextSection({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.blueGrey,
      ),
    );
  }
}
