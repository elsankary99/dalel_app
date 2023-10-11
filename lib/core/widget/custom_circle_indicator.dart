import 'package:flutter/material.dart';

class CustomCircleIndicator extends StatelessWidget {
  final Color? color;
  const CustomCircleIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: color ?? Colors.white,
    ));
  }
}
