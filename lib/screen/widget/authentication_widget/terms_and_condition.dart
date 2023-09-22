import 'package:flutter/material.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/constant/app_text_style.dart';
import 'package:test/screen/widget/authentication_widget/custom_check_box.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        Text(
          AppStrings.iHaveAgreeToOur,
          textAlign: TextAlign.center,
          style: CustomTextStyles.poppins400style12,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            AppStrings.termsAndCondition,
            textAlign: TextAlign.center,
            style: CustomTextStyles.poppins400style12.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
