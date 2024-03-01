import 'package:dalel/features/auth/presentation/model_view/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthIniailState());

  String? fristName, lastName, email, password;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> signupFormKey = GlobalKey();
  final GlobalKey<FormState> signinFormKey = GlobalKey();
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();

  bool termsAndConditionCheckBoxValue = false;
  bool obscurePassword = true;

  createAccountWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      User? user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      creatingAccountHandleException(e);
    } catch (e) {
      emit(SignUpFailureState(errMessage: e.toString()));
    }
  }

  signInWithEmailAndPassword() async {
    try {
      emit(SignInLoadingState());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);

      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      signInWithEmailAndPasswordFailure(e);
    } catch (e) {
      emit(SignInFailureState(errMessage: e.toString()));
    }
  }

  void signInWithEmailAndPasswordFailure(FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      emit(const SignInFailureState(
          errMessage: 'No user found for that email.'));
    } else if (e.code == 'wrong-password') {
      emit(const SignInFailureState(
          errMessage: 'Wrong password provided for that user.'));
    } else if (e.code == 'invalid-email') {
      emit(const SignInFailureState(errMessage: 'The email is invalid.'));
    } else if (e.code == "invalid-credential") {
      emit(const SignInFailureState(errMessage: 'Email or Password was wrong'));
    } else {
      emit(SignInFailureState(errMessage: e.code));
    }
  }

  void creatingAccountHandleException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(const SignUpFailureState(
          errMessage: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(const SignUpFailureState(
          errMessage: 'The account already exists for that email.'));
    } else if (e.code == 'invalid-email') {
      emit(const SignUpFailureState(errMessage: 'The email is invalid.'));
    } else {
      emit(SignUpFailureState(errMessage: e.code));
    }
  }

  updateTermsAndConditionCheckBox({required bool newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(TermsAndConditionCheckBoxState());
  }

  updateObscurePassword({required bool newValue}) {
    obscurePassword = newValue;
    emit(ObscurePasswordState());
  }

  updateAutoValidaionMode({required AutovalidateMode mode}) {
    autoValidateMode = mode;
    emit(AutoValidationModeState());
  }

  forgotPassword() async {
    try {
      emit(ForgotPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
      emit(ForgotPasswordSuccessState());
    } catch (e) {
      emit(ForgotPasswordFailureState(errMessage: e.toString()));
    }
  }
}
