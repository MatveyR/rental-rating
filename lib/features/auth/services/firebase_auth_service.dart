import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  String generatePassword({int length = 16}) {
    const abc =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890_?#@';
    Random rand = Random(DateTime.now().microsecondsSinceEpoch);
    return String.fromCharCodes(Iterable.generate(
        length, (_) => abc.codeUnitAt(rand.nextInt(abc.length))));
  }

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
      debugPrint(e.message);
      rethrow;
    }
    return null;
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<String?> signUpWithEmail(String email, String password, VoidCallback onSuccess, VoidCallback onFail) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await _auth.currentUser?.sendEmailVerification();

      onSuccess.call();
      return "На вашу почту было отправлено письмо для подтверждения адреса";
    } on FirebaseAuthException catch (e) {
      onFail.call();
      return e.code;
    } catch (e) {
      onFail.call();
      return e.toString();
    }
  }

  Future<String?> sendVerificationEmail(String email) async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      // Ожидаем завершения отправки письма для подтверждения почты перед возвратом сообщения
      await _auth.userChanges().firstWhere((User? user) => user != null && user.emailVerified == true);
      return "E-mail подтверждён";
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return e.toString();
    }
  }
}
