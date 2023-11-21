import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';

Future<void> showMyDialog(BuildContext context,
    {required String header,
    required String title,
    required String btnTitle,
    Widget? child,
    required void Function()? onPressed}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(header),
        backgroundColor: AppColors.offWhite,
        content: Text(
          title,
          style: CustomTextStyles.poppins400style14
              .copyWith(color: AppColors.blackGrey),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.offWhite,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(color: Colors.grey))),
                      child: Text(
                        "No",
                        style: CustomTextStyles.poppins300style16,
                      )),
                ),
                SizedBox(width: context.width * 0.02),
                Expanded(
                  child: ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: child ??
                          Text(
                            btnTitle,
                            style: CustomTextStyles.poppins500style16
                                .copyWith(color: AppColors.offWhite),
                          )),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Future<void> getImage(BuildContext context,
    {required void Function()? galleryBtn,
    required void Function()? cameraBtn}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).canvasColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SizedBox(
              height: context.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10.h),
                  ElevatedButton(
                      onPressed: galleryBtn,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: Text(
                        "Image From Gallery",
                        style: CustomTextStyles.poppins500style16
                            .copyWith(color: AppColors.offWhite),
                      )),
                  ElevatedButton(
                      onPressed: cameraBtn,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: Text(
                        "Image From Camera",
                        style: CustomTextStyles.poppins500style16
                            .copyWith(color: AppColors.offWhite),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).canvasColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(color: Colors.grey))),
                      child: Text(
                        "Cancel",
                        style: CustomTextStyles.poppins500style16,
                      )),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
