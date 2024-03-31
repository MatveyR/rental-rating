import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rental_rating/features/auth/auth.dart';
import '../../../router/router.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHiddenPassword = true;
  TextEditingController loginTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    loginTextInputController.dispose();
    passwordTextInputController.dispose();

    super.dispose();
  }

  Future<void> login() async {
    final navigator = AutoRouter.of(context);

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginTextInputController.text.trim(),
        password: passwordTextInputController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);

      bool res = await showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Ошибка!"),
              content: Text("Неверный логин или пароль"),
            );
          });

      return;
    }

    navigator.pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 200, 24, 0),
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Color.fromARGB(255, 20, 25, 69),
                    fontFamily: 'Inter',
                  ),
                  children: <TextSpan>[
                    TextSpan(text: "Добро пожаловать\nв "),
                    TextSpan(
                      text: "HomeHunt 👋",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    LoginFormField(
                      hintText: "Телефон / Электронная почта",
                      controller: loginTextInputController,
                    ),
                    const SizedBox(height: 8),
                    PasswordFormField(
                      hintText: "Пароль",
                      controller: passwordTextInputController,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              LongElevatedButton(
                text: "Войти",
                onPressed: login,
              ),
              LongTextButton(
                text: "Зарегистрироваться",
                onPressed: () => AutoRouter.of(context).pushAndPopUntil(
                  const SignUpRoute(),
                  predicate: (_) => false,
                ),
              ),
              const SizedBox(height: 32),
              LongGoogleButton(
                onPressed: () async {
                  FirebaseService service = FirebaseService();
                  try {
                    await service.signInWithGoogle();
                    AutoRouter.of(context).pushAndPopUntil(
                      const HomeRoute(),
                      predicate: (_) => false,
                    );
                  } catch (e) {
                    if (e is FirebaseAuthException) {
                      print(e.message);
                    }
                  }
                },
              ),
              const SizedBox(height: 32),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Color.fromARGB(163, 20, 25, 69),
                    fontFamily: 'Inter',
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                      text:
                          "By creating an account or logging in,\nyou agree to our ",
                    ),
                    TextSpan(
                      text: "privacy policy",
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                title: Text("Error"),
                                content: Text(
                                    "The privacy policy has not been added yet"),
                              );
                            },
                          );
                        },
                    ),
                    const TextSpan(text: "."),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 230,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: -10,
                bottom: 0,
                child: Image.asset(
                  'assets/Background.png',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      rethrow;
    }
    return null;
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
