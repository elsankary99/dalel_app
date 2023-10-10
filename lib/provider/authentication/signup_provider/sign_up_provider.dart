import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'sign_up_state.dart';

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

  void termsAndCondition(bool active) {
    activeTerms = active;
    state = TermsAndCondition();
  }
}
