import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test/core/constant/app_colors.dart';
import 'package:test/core/extension/media_query.dart';
import 'package:test/core/widget/custom_circle_indicator.dart';
import 'package:test/core/widget/custom_dialog.dart';
import 'package:test/core/widget/custom_toast.dart';
import 'package:test/provider/add_image_provider/add_image_provider.dart';

class ImageProfile extends ConsumerWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(addImageProvider.notifier);
    final state = ref.watch(addImageProvider);
    ref.listen(addImageProvider, (previous, current) {
      if (current is AddImageSuccess) {
        customToast(title: "Image Added Successfully");
      }
      if (current is AddImageError) {
        customToast(title: current.message, color: Colors.red);
      }
    });
    return GestureDetector(
      onTap: () {
        getImage(context, cameraBtn: () {
          provider.getImage(ImageSource.camera);
        }, galleryBtn: () {
          provider.getImage(ImageSource.gallery);
        });
      },
      child: Container(
        height: context.height * 0.2,
        width: context.height * 0.2,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: AppColors.primaryColor),
        child: state is AddImageLoading
            ? CustomCircleIndicator(
                color: AppColors.offWhite,
              )
            : Center(
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.offWhite,
                  size: 35.sp,
                ),
              ),
      ),
    );
  }
}
