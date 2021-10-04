import 'package:flutter/material.dart';

class CircleIconWidget extends StatelessWidget {
  final Gradient gradient;
  final Widget icon;

  const CircleIconWidget({
    Key? key,
    required this.gradient,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        gradient: gradient,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: icon,
      ),
    );
  }
}
