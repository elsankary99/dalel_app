import 'package:test/core/constant/app_images.dart';
import 'package:test/core/constant/app_strings.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String subTitle;

  OnBoardingModel(
      {required this.image, required this.title, required this.subTitle});
}

List<OnBoardingModel> onboardingList = [
  OnBoardingModel(
    image: Assets.assetsImagesOnBoarding1,
    title: AppStrings.onboardingTitle1,
    subTitle: AppStrings.onboardingSubTitle1,
  ),
  OnBoardingModel(
    image: Assets.assetsImagesOnBoarding2,
    title: AppStrings.onboardingTitle2,
    subTitle: AppStrings.onboardingSubTitle2,
  ),
  OnBoardingModel(
    image: Assets.assetsImagesOnBoarding3,
    title: AppStrings.onboardingTitle3,
    subTitle: AppStrings.onboardingSubTitle3,
  ),
];
