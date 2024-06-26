import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rental_rating/router/router.dart';

@RoutePage()
class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final user = FirebaseAuth.instance.currentUser;

  Future<void> signOut() async {
    final navigator = AutoRouter.of(context);

    await FirebaseAuth.instance.signOut();
    navigator.pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            AutoRouter.of(context)
                .pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
          },
          icon: Image.asset("assets/ArrowLeft.png", scale: 3,),
        ),
        title: const Text('Аккаунт'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Open shopping cart',
            onPressed: () => signOut(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ваш Email: ${user?.email}'),
            TextButton(
              onPressed: () => signOut(),
              child: const Text('Выйти'),
            ),
            ElevatedButton(
                onPressed: () => AutoRouter.of(context).pushAndPopUntil(
                    const PublishAdvertisementRoute(),
                    predicate: (_) => false),
                child: const Text("Опубликовать объявление")),
          ],
        ),
      ),
    );
  }
}
