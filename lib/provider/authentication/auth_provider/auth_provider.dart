import 'dart:developer';

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
  Future<void> signUpWithEmailAndPassword() async {
    if (signUpKey.currentState!.validate()) {
      try {
        state = SignUpLoading();
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress!,
          password: password!,
        );
        state = SignUpSuccess();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          state = const SignUpFailure('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          state =
              const SignUpFailure('The account already exists for that email.');
        }
      } catch (e) {
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

  void termsAndCondition(bool active) {
    activeTerms = active;
    state = TermsAndCondition();
  }
}