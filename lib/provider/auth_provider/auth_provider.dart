import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'auth_state.dart';

final authProvider =
    StateNotifierProvider<AuthProvider, AuthState>((ref) => AuthProvider());

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider() : super(AuthInitial());
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? password;
  bool activeTerms = false;
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();
  Future<void> signUpWithEmailAndPassword() async {
    if (signUpKey.currentState!.validate()) {
      try {
        log("SignUpLoading");
        state = SignUpLoading();
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress!,
          password: password!,
        );
        log("SignUpSuccess");
        await addUserProfile();
        await sendVerifyEmail();
        state = SignUpSuccess();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          log('The password provided is too weak.');

          state = const SignUpFailure('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          log('The account already exists for that email.');

          state =
              const SignUpFailure('The account already exists for that email.');
        } else {
          log(e.toString());

          state = SignUpFailure(e.toString());
        }
      } catch (e) {
        log(e.toString());
        state = SignUpFailure(e.toString());
      }
    }
  }

  Future<void> login() async {
    if (loginKey.currentState!.validate()) {
      state = LoginLoading();
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress!,
          password: password!,
        );
        if (!FirebaseAuth.instance.currentUser!.emailVerified) {
          log("email verified == ${FirebaseAuth.instance.currentUser!.emailVerified}");
          await sendVerifyEmail();
        }
        state = LoginSuccess();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          state = const LoginFailure('No user found for that email.');

          log('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          state = const LoginFailure('Wrong password provided for that user.');
          log('Wrong password provided for that user.');
        } else {
          state = const LoginFailure(
              'there are some thing went wrong with your email or password.');
          log('there are some thing went wrong with your email or password.');
        }
      } catch (e) {
        state = LoginFailure(e.toString());
        log(e.toString());
      }
    }
  }

  Future<void> logOut() async {
    state = LogOutLoading();
    try {
      await FirebaseAuth.instance.signOut();
      state = LogOutSuccess();
      log('LogOutSuccess.');
    } on FirebaseAuthException catch (e) {
      log(e.toString());

      state = LogOutFailure(e.toString());
    } catch (e) {
      log(e.toString());

      state = LogOutFailure(e.toString());
    }
  }

  Future<void> resetPassword() async {
    if (resetPasswordKey.currentState!.validate()) {
      state = ResetPasswordLoading();
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailAddress!);
        state = ResetPasswordSuccess();
        log('ResetPasswordSuccess.');
      } on FirebaseAuthException catch (e) {
        log(e.toString());

        state = ResetPasswordFailure(e.toString());
      } catch (e) {
        log(e.toString());

        state = ResetPasswordFailure(e.toString());
      }
    }
  }

  Future<void> sendVerifyEmail() async {
    log("sendEmailVerification");
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  void termsAndCondition(bool active) {
    activeTerms = active;
    state = TermsAndCondition();
  }

  Future<void> addUserProfile() async {
    final users = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    await users.set({
      'image_url': null,
      'first_name': firstName, // John Doe
      'last_name': lastName, // Stokes and Sons
    });
  }
}
