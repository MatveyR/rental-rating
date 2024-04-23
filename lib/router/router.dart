import 'package:auto_route/auto_route.dart';
import 'package:rental_rating/features/account/account.dart';
import 'package:rental_rating/features/advertisement/advertisement.dart';
import 'package:rental_rating/features/auth/auth.dart';
import 'package:rental_rating/features/home/home.dart';
import 'package:rental_rating/router/guards/login_guard.dart';
import 'package:rental_rating/repositories/advertisements/models/advertisement.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, path: "/", guards: [LoginGuard()]),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: AccountRoute.page, guards: [LoginGuard()]),
    AutoRoute(page: VerifyEmailRoute.page, guards: [LoginGuard()]),
    AutoRoute(page: PublishAdvertisementRoute.page, guards: [LoginGuard()]),
    AutoRoute(page: EmailSignUpRoute.page),
    AutoRoute(page: AdvertisementRoute.page)
  ];
}