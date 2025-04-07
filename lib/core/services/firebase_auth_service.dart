import 'dart:developer';

import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code: ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة مرورك ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'هذا البريد الالكتروني مستخدم بالفعل');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'لا يوجد اتصال بالشبكة, حاول مرة أخرى لاحقا');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'البريد الالكتروني غير صحيح');
      } else {
        throw CustomException(message: 'هناك خطأ ما, حاول مرة اخرى لاحقا');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}');
      throw CustomException(message: 'هناك خطأ ما, حاول مرة اخرى لاحقا');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code: ${e.code}');
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'هذا البريد الالكتروني غير مسجل');
      } else if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
        throw CustomException(
            message: '.البريد الالكتروني أو كلمة المرور غير صحيح');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'لا يوجد اتصال بالشبكة, حاول مرة أخرى لاحقا');
      } else {
        throw CustomException(message: 'هناك خطأ ما, حاول مرة اخرى لاحقا');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}');
      throw CustomException(message: 'هناك خطأ ما, حاول مرة اخرى لاحقا');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }
}
