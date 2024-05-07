abstract class LoginState{
  const LoginState();
}

class LoginScreenLoadingState extends LoginState{

}

class LoginScreenInitialState extends LoginState{

}

class LoginScreenLoadedState extends LoginState{

}

class LoginScreenErrorState extends LoginState{
  String error;
  LoginScreenErrorState({
    required this.error,
  });
}

class PhoneAuthCodeSentSuccess extends LoginState{
  final String verificationId;
 PhoneAuthCodeSentSuccess({required this.verificationId});
}

class SignUpScreenOtpSuccessState extends LoginState{
  
}