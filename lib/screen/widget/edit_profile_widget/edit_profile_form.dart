import 'package:flutter/material.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/widget/custom_txt_form.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            onChanged: (firstName) {}, labelText: AppStrings.firstName),
        CustomTextFormField(
            onChanged: (lastName) {}, labelText: AppStrings.lastName),
      ],
    );
  }
}
