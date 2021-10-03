import 'package:flutter/material.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Color? valueColor;

  const LoadingIndicatorWidget({
    Key? key,
    this.backgroundColor,
    this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: backgroundColor,
        valueColor: AlwaysStoppedAnimation<Color?>(valueColor),
      ),
    );
  }
}
