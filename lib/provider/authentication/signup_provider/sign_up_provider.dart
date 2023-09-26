import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'sign_up_state.dart';

final signUpProvider = StateNotifierProvider<SignUpProvider, SignUpState>(
    (ref) => SignUpProvider());

class SignUpProvider extends StateNotifier<SignUpState> {
  SignUpProvider() : super(SignUpInitial());
  late String? firstName;
  late String? lastName;
  late String? emailAddress;
  late String? password;

  Future<void> signUpWithEmailAndPassword() async {
    try {
      state = SignUpLoading();
      // ignore: unused_local_variable
      final credential =
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
