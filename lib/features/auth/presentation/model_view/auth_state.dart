abstract class AuthState {
  const AuthState();
}

class AuthIniailState extends AuthState {}

class SignUpLoadingState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpFailureState extends AuthState {
  final String errMessage;

  const SignUpFailureState({required this.errMessage});
}

class TermsAndConditionCheckBoxState extends AuthState {}

class ObscurePasswordState extends AuthState {}

class AutoValidationModeState extends AuthState {}

class SignInLoadingState extends AuthState {}

class SignInSuccessState extends AuthState {}

class SignInFailureState extends AuthState {
  final String errMessage;

  const SignInFailureState({required this.errMessage});
}

class ForgotPasswordLoadingState extends AuthState {}

class ForgotPasswordSuccessState extends AuthState {}

class ForgotPasswordFailureState extends AuthState {
  final String errMessage;

  const ForgotPasswordFailureState({required this.errMessage});
}
