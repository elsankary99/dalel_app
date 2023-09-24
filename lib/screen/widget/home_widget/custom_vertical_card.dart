import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/core/extension/media_query.dart';

class CustomVerticalCard extends StatelessWidget {
  const CustomVerticalCard({
    super.key,
    required this.image,
    required this.text,
  });
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.24,
      child: Card(
        margin: const EdgeInsets.only(right: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(6)),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 6,
              ),
              child: Text(
                text,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: CustomTextStyles.poppins500style16
                    .copyWith(fontSize: 13.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
