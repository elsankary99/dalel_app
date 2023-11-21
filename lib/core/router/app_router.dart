import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/data/model/bazar_model/bazar_model.dart';
import 'package:test/data/model/historycal_model/historycal_model.dart';
import 'package:test/screen/view/Home/initial_page.dart';
import 'package:test/screen/view/check_out/check_out_page.dart';
import 'package:test/screen/view/edit_profile/edit_profile_page.dart';
import 'package:test/screen/view/my_cart/my_cart_page.dart';
import 'package:test/screen/view/authentication/Login/login_page.dart';
import 'package:test/screen/view/OnBoarding/onboarding_page.dart';
import 'package:test/screen/view/authentication/SignUp/signup_page.dart';
import 'package:test/screen/view/authentication/forget_Password/forget_password_page.dart';
import 'package:test/screen/view/authentication/verify_email/verifiy_email_page.dart';
import 'package:test/screen/view/bazar_details/bazar_details_page.dart';
import 'package:test/screen/view/character_details/character_details.dart';
import 'package:test/screen/view/order_success/order_success_page.dart';
import 'package:test/screen/view/periods_details/periods_details_page.dart';
import 'package:test/screen/view/souvenirs_details/souvenirs_details_page.dart';
import 'package:test/screen/view/splash/splash_page.dart';
import 'package:test/screen/view/war_details/war_details_page.dart';

part 'app_router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        //? Splash
        AutoRoute(page: SplashRoute.page, initial: true),
        //? On Boarding
        AutoRoute(page: OnBoardingRoute.page),
        //? Authentication
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: ForgetPasswordRoute.page),
        AutoRoute(page: VerifyEmailRoute.page),
        //? Home
        AutoRoute(page: InitialRoute.page),
        AutoRoute(page: MyCartRoute.page),
        AutoRoute(page: CharacterDetailsRoute.page),
        AutoRoute(page: PeriodsDetailsRoute.page),
        AutoRoute(page: SouvenirsDetailsRoute.page),
        AutoRoute(page: WarDetailsRoute.page),
        AutoRoute(page: BazarDetailsRoute.page),
        AutoRoute(page: OrderSuccessRoute.page),
        AutoRoute(page: CheckoutRoute.page),
        AutoRoute(page: EditProfileRoute.page),
      ];
}
