import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rental_rating/features/auth/auth.dart';
import 'package:rental_rating/features/auth/widgets/bottom_dialog.dart';

import '../../../router/router.dart';

@RoutePage()
class EmailSignUpScreen extends StatefulWidget {
  const EmailSignUpScreen({super.key});

  @override
  State<EmailSignUpScreen> createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  FirebaseAuthService authService = FirebaseAuthService();
  final formKey = GlobalKey<FormState>();
  bool passwordsMatch = true;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
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
                .pushAndPopUntil(const SignUpRoute(), predicate: (_) => false),
          ),
        ),
        body: StreamBuilder<User?>(
            stream: authService.authStateChanges,
            builder: (context, snapshot) {
              final user = snapshot.data;
              if (user != null && user.emailVerified) {
                AutoRouter.of(context).pushAndPopUntil(const HomeRoute(),
                    predicate: (_) => false);
              }
              return Padding(
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
                child: Column(
                  children: [
                    const Row(children: [
                      Text("Регистрация по электронной почте",
                          style: TextStyle(fontSize: 16))
                    ]),
                    const SizedBox(height: 24),
                    SizedBox(
                        height: 44,
                        child: InputFormField(
                          hintText: "Введите почту",
                          controller: emailController,
                        )),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 44,
                      child: PasswordFormField(
                        hintText: "Введите пароль",
                        controller: passwordController,
                        change: (_) {
                          setState(() {
                            passwordsMatch =
                                (repeatPasswordController.text.trim() ==
                                    passwordController.text.trim());
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 44,
                      child: PasswordFormField(
                        hintText: "Повторите парль",
                        controller: repeatPasswordController,
                        change: (_) {
                          setState(() {
                            passwordsMatch =
                                (repeatPasswordController.text.trim() ==
                                    passwordController.text.trim());
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    passwordsMatch
                        ? Row(
                            children: [
                              const SizedBox(width: 5),
                              Image.asset('assets/Ok.png', scale: 3),
                              const SizedBox(width: 5),
                              const Text(
                                "Пароли совпадают",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 85, 213, 25),
                                    fontSize: 14),
                              )
                            ],
                          )
                        : Row(
                            children: [
                              Image.asset('assets/Cross.png', scale: 3),
                              const Text(
                                "Пароли не совпадают",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 0, 0),
                                    fontSize: 14),
                              )
                            ],
                          ),
                    const SizedBox(height: 16),
                    LongElevatedButton(
                        color: const Color.fromARGB(255, 48, 67, 237),
                        text: "Зарегистрироваться",
                        onPressed: () async {
                          if (passwordsMatch) {
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();
                            await authService.signUpWithEmail(email, password,
                                () async {
                              BottomDialog.showBottomDialog(
                                  height: 350,
                                  context: context,
                                  text:
                                      "На вашу почту было отправлено\nписьмо для подтверждения\nадреса");
                              Future.delayed(const Duration(seconds: 5), () {
                                AutoRouter.of(context).pushAndPopUntil(
                                  const HomeRoute(),
                                  predicate: (_) => false,
                                );
                              });
                            }, () {
                              BottomDialog.showBottomDialog(
                                  height: 350,
                                  context: context,
                                  text:
                                      "Произошла ошибка\nво время регистрации");
                            });
                          } else {
                            BottomDialog.showBottomDialog(
                                text: "Пароли должны совпадать",
                                height: 350,
                                context: context);
                          }
                        })
                  ],
                ),
              );
            }));
  }
}
