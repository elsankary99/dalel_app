import 'package:flutter/material.dart';
import 'package:test/core/constant/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: isActive,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        activeColor: AppColors.primaryColor,
        onChanged: (value) {
          setState(() {
            isActive = value!;
          });
        });
  }
}
