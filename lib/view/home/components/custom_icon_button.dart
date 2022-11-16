import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final double splashRadius;
  final VoidCallback function;
  final double? size;

  const CustomIconButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.splashRadius,
    required this.function,
    this.size = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: splashRadius,
      onPressed: function,
      icon: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}
