// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountScreen(),
      );
    },
    AdvertisementRoute.name: (routeData) {
      final args = routeData.argsAs<AdvertisementRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AdvertisementScreen(
          key: args.key,
          advertisement: args.advertisement,
        ),
      );
    },
    EmailSignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmailSignUpScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    PublishAdvertisementRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PublishAdvertisementScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VerifyEmailScreen(),
      );
    },
  };
}

/// generated route for
/// [AccountScreen]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AdvertisementScreen]
class AdvertisementRoute extends PageRouteInfo<AdvertisementRouteArgs> {
  AdvertisementRoute({
    Key? key,
    required Advertisement advertisement,
    List<PageRouteInfo>? children,
  }) : super(
          AdvertisementRoute.name,
          args: AdvertisementRouteArgs(
            key: key,
            advertisement: advertisement,
          ),
          initialChildren: children,
        );

  static const String name = 'AdvertisementRoute';

  static const PageInfo<AdvertisementRouteArgs> page =
      PageInfo<AdvertisementRouteArgs>(name);
}

class AdvertisementRouteArgs {
  const AdvertisementRouteArgs({
    this.key,
    required this.advertisement,
  });

  final Key? key;

  final Advertisement advertisement;

  @override
  String toString() {
    return 'AdvertisementRouteArgs{key: $key, advertisement: $advertisement}';
  }
}

/// generated route for
/// [EmailSignUpScreen]
class EmailSignUpRoute extends PageRouteInfo<void> {
  const EmailSignUpRoute({List<PageRouteInfo>? children})
      : super(
          EmailSignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmailSignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
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
/// [PublishAdvertisementScreen]
class PublishAdvertisementRoute extends PageRouteInfo<void> {
  const PublishAdvertisementRoute({List<PageRouteInfo>? children})
      : super(
          PublishAdvertisementRoute.name,
          initialChildren: children,
        );

  static const String name = 'PublishAdvertisementRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpScreen]
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
/// [VerifyEmailScreen]
class VerifyEmailRoute extends PageRouteInfo<void> {
  const VerifyEmailRoute({List<PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
