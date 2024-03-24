import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rental_rating/router/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      AutoRouter.of(context).pushAndPopUntil(
          const VerifyEmailRoute(),
          predicate: (_) => false);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Главная страница'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if ((user == null)) {
                AutoRouter.of(context).push(const LoginRoute());
              } else {
                AutoRouter.of(context).push(const AccountRoute());
              }
            },
            icon: Icon(
              Icons.person,
              color: (user == null) ? Colors.black : Colors.yellow,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: (user == null)
              ? const Text("Контент для\nНЕ зарегистрированных в системе",
                            textAlign: TextAlign.center)
              : const Text('Контент для\nЗАРЕГИСТРИРОВАННЫХ в системе',
                            textAlign: TextAlign.center),
        ),
      ),
    );
  }
}