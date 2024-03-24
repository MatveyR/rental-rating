import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_rating/router/router.dart';
import 'package:rental_rating/theme/appTheme.dart';

class RentalRatingApp extends StatefulWidget {
  const RentalRatingApp({
    super.key,
  });

  @override
  State<RentalRatingApp> createState() {
    return _RentalRatingApp();
  }
}

class _RentalRatingApp extends State<RentalRatingApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'RentalRating',
      //theme: darkTheme,
      routerConfig: _appRouter.config(),
    );
  }
}