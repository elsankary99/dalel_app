import 'package:flutter/material.dart';
import 'package:test/core/constant/app_colors.dart';

abstract class CustomTextStyles {
  static final pacifico400style64 = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w400,
    color: AppColors.deebBrown,
    fontFamily: "Pacifico",
  );
  static final pacifico600style28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontFamily: "Poppins",
  );
  static final pacifico400style12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.deebGrey,
    fontFamily: "Poppins",
  );
  static final pacifico500style18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
    fontFamily: "Poppins",
  );
  static const poppins500style24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: "Poppins",
  );
  static const poppins300style16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Colors.black,
    fontFamily: "Poppins",
  );
}