import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/core/constant/app_strings.dart';
import 'package:test/core/widget/custom_txt_form.dart';
import 'package:test/provider/add_image_provider/add_image_provider.dart';

class EditProfileForm extends ConsumerStatefulWidget {
  const EditProfileForm({
    required this.firstName,
    required this.lastName,
    super.key,
  });
  final String firstName;
  final String lastName;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileFormState();
}

class _EditProfileFormState extends ConsumerState<EditProfileForm> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  @override
  void initState() {
    firstNameController.text = widget.firstName;
    lastNameController.text = widget.lastName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(addImageProvider.notifier);
    return Form(
      key: provider.editKey,
      child: Column(
        children: [
          CustomTextFormField(
              controller: firstNameController,
              onSaved: (firstName) {
                provider.firstName = firstName!.trim();
              },
              labelText: AppStrings.firstName),
          CustomTextFormField(
              controller: lastNameController,
              onSaved: (lastName) {
                provider.lastName = lastName!.trim();
              },
              labelText: AppStrings.lastName),
        ],
      ),
    );
  }
}
