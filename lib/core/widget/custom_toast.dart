import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test/core/constant/app_colors.dart';

customToast({required String title, Color? color}) {
  Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color ?? AppColors.primaryColor,
      textColor: Colors.white,
      fontSize: 18);
}
