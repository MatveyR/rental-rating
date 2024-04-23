import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rental_rating/features/auth/auth.dart';
import 'package:rental_rating/router/router.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  bool isHiddenPassword = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  TextEditingController passwordTextRepeatInputController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();
    passwordTextRepeatInputController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> signUp() async {
    final navigator = AutoRouter.of(context);

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    if (passwordTextInputController.text !=
        passwordTextRepeatInputController.text) {
      debugPrint("Пароли должны совпадать");
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextInputController.text.trim(),
        password: passwordTextInputController.text.trim(),
      );
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.code);
      navigator.pushAndPopUntil(HomeRoute(), predicate: (_) => false);
    }

    navigator.pushAndPopUntil(LoginRoute(), predicate: (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Регистрация'),
          centerTitle: true,
          leading: IconButton(
            icon: Image.asset(
              'assets/ArrowLeft.png',
              scale: 3,
            ),
            onPressed: () => AutoRouter.of(context)
                .pushAndPopUntil(const LoginRoute(), predicate: (_) => false),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
          child: Column(
            children: [
              LongGoogleButton(
                onPressed: () async {
                  FirebaseAuthService service = FirebaseAuthService();
                  try {
                    await service.signInWithGoogle();
                    AutoRouter.of(context).pushAndPopUntil(
                      const HomeRoute(),
                      predicate: (_) => false,
                    );
                  } catch (e) {
                    if (e is FirebaseAuthException) {
                      debugPrint(e.message);
                    }
                  }
                },
              ),
              const SizedBox(height: 32),
              Image.asset("assets/Or.png", scale: 3),
              const SizedBox(height:32),
              LongElevatedButton(
                color: const Color.fromARGB(255, 48, 67, 237),
                text: "Регистрация по номеру телефона",
                onPressed: () => AutoRouter.of(context).pushAndPopUntil(
                    const HomeRoute(),
                    predicate: (_) => false),
              ),
              const SizedBox(height: 32),
              Image.asset("assets/Or.png", scale: 3),
              const SizedBox(height: 32),
              LongElevatedButton(
                color: const Color.fromARGB(255, 48, 67, 237),
                text: "Регистрация по e-mail",
                onPressed: () => AutoRouter.of(context).pushAndPopUntil(
                    const EmailSignUpRoute(),
                    predicate: (_) => false),
              )
            ],
          ),
        ));
  }
}
