// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BazarDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BazarDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BazarDetailsPage(
          args.data,
          key: args.key,
        ),
      );
    },
    CharacterDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CharacterDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CharacterDetailsPage(
          data: args.data,
          key: args.key,
        ),
      );
    },
    CheckoutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CheckoutPage(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditProfilePage(),
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgetPasswordPage(),
      );
    },
    InitialRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InitialPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    MyCartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyCartPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnBoardingPage(),
      );
    },
    OrderSuccessRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderSuccessPage(),
      );
    },
    PeriodsDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PeriodsDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PeriodsDetailsPage(
          key: args.key,
          data: args.data,
        ),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpPage(),
      );
    },
    SouvenirsDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SouvenirsDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SouvenirsDetailsPage(
          key: args.key,
          data: args.data,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VerifyEmailPage(),
      );
    },
    WarDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<WarDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WarDetailsPage(
          args.data,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [BazarDetailsPage]
class BazarDetailsRoute extends PageRouteInfo<BazarDetailsRouteArgs> {
  BazarDetailsRoute({
    required BazarModel data,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          BazarDetailsRoute.name,
          args: BazarDetailsRouteArgs(
            data: data,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'BazarDetailsRoute';

  static const PageInfo<BazarDetailsRouteArgs> page =
      PageInfo<BazarDetailsRouteArgs>(name);
}

class BazarDetailsRouteArgs {
  const BazarDetailsRouteArgs({
    required this.data,
    this.key,
  });

  final BazarModel data;

  final Key? key;

  @override
  String toString() {
    return 'BazarDetailsRouteArgs{data: $data, key: $key}';
  }
}

/// generated route for
/// [CharacterDetailsPage]
class CharacterDetailsRoute extends PageRouteInfo<CharacterDetailsRouteArgs> {
  CharacterDetailsRoute({
    required HistoricalModel data,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CharacterDetailsRoute.name,
          args: CharacterDetailsRouteArgs(
            data: data,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CharacterDetailsRoute';

  static const PageInfo<CharacterDetailsRouteArgs> page =
      PageInfo<CharacterDetailsRouteArgs>(name);
}

class CharacterDetailsRouteArgs {
  const CharacterDetailsRouteArgs({
    required this.data,
    this.key,
  });

  final HistoricalModel data;

  final Key? key;

  @override
  String toString() {
    return 'CharacterDetailsRouteArgs{data: $data, key: $key}';
  }
}

/// generated route for
/// [CheckoutPage]
class CheckoutRoute extends PageRouteInfo<void> {
  const CheckoutRoute({List<PageRouteInfo>? children})
      : super(
          CheckoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckoutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditProfilePage]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgetPasswordPage]
class ForgetPasswordRoute extends PageRouteInfo<void> {
  const ForgetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InitialPage]
class InitialRoute extends PageRouteInfo<void> {
  const InitialRoute({List<PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyCartPage]
class MyCartRoute extends PageRouteInfo<void> {
  const MyCartRoute({List<PageRouteInfo>? children})
      : super(
          MyCartRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyCartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnBoardingPage]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute({List<PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderSuccessPage]
class OrderSuccessRoute extends PageRouteInfo<void> {
  const OrderSuccessRoute({List<PageRouteInfo>? children})
      : super(
          OrderSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderSuccessRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PeriodsDetailsPage]
class PeriodsDetailsRoute extends PageRouteInfo<PeriodsDetailsRouteArgs> {
  PeriodsDetailsRoute({
    Key? key,
    required HistoricalModel data,
    List<PageRouteInfo>? children,
  }) : super(
          PeriodsDetailsRoute.name,
          args: PeriodsDetailsRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'PeriodsDetailsRoute';

  static const PageInfo<PeriodsDetailsRouteArgs> page =
      PageInfo<PeriodsDetailsRouteArgs>(name);
}

class PeriodsDetailsRouteArgs {
  const PeriodsDetailsRouteArgs({
    this.key,
    required this.data,
  });

  final Key? key;

  final HistoricalModel data;

  @override
  String toString() {
    return 'PeriodsDetailsRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SouvenirsDetailsPage]
class SouvenirsDetailsRoute extends PageRouteInfo<SouvenirsDetailsRouteArgs> {
  SouvenirsDetailsRoute({
    Key? key,
    required HistoricalModel data,
    List<PageRouteInfo>? children,
  }) : super(
          SouvenirsDetailsRoute.name,
          args: SouvenirsDetailsRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'SouvenirsDetailsRoute';

  static const PageInfo<SouvenirsDetailsRouteArgs> page =
      PageInfo<SouvenirsDetailsRouteArgs>(name);
}

class SouvenirsDetailsRouteArgs {
  const SouvenirsDetailsRouteArgs({
    this.key,
    required this.data,
  });

  final Key? key;

  final HistoricalModel data;

  @override
  String toString() {
    return 'SouvenirsDetailsRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyEmailPage]
class VerifyEmailRoute extends PageRouteInfo<void> {
  const VerifyEmailRoute({List<PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WarDetailsPage]
class WarDetailsRoute extends PageRouteInfo<WarDetailsRouteArgs> {
  WarDetailsRoute({
    required HistoricalModel data,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          WarDetailsRoute.name,
          args: WarDetailsRouteArgs(
            data: data,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WarDetailsRoute';

  static const PageInfo<WarDetailsRouteArgs> page =
      PageInfo<WarDetailsRouteArgs>(name);
}

class WarDetailsRouteArgs {
  const WarDetailsRouteArgs({
    required this.data,
    this.key,
  });

  final HistoricalModel data;

  final Key? key;

  @override
  String toString() {
    return 'WarDetailsRouteArgs{data: $data, key: $key}';
  }
}
