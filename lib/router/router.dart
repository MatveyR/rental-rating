import 'package:auto_route/auto_route.dart';
import 'package:rental_rating/features/account/account.dart';
import 'package:rental_rating/features/auth/auth.dart';
import 'package:rental_rating/features/home/home.dart';
import 'package:rental_rating/router/verify_email_guard.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, path: "/", guards: [VerifyEmailGuard()]),
    AutoRoute(page: LoginRoute.page,),
    AutoRoute(page: SignUpRoute.page,),
    AutoRoute(page: AccountRoute.page, guards: [VerifyEmailGuard()]),
    AutoRoute(page: VerifyEmailRoute.page)
  ];
}