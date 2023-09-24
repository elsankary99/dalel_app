import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';

class ListOfType extends StatelessWidget {
  const ListOfType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.05,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
              shadowColor: AppColors.deepGrey,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    AppStrings.oldBooks,
                    style: CustomTextStyles.poppins400style20
                        .copyWith(fontSize: 12.sp),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
