import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginEvents{
  const LoginEvents();

}
class SendOtpToPhoneEvent extends LoginEvents{
  final String number;
  SendOtpToPhoneEvent({required this.number});
}
class OnPhoneOtpSend extends LoginEvents{
  final String verificationId;
  final int? token;

  OnPhoneOtpSend({
    required this.verificationId,
    required this.token,
  });
}
class VerifySentOtp extends LoginEvents{
  final String otpCode;
  final String verificationId;

  VerifySentOtp({
    required this.otpCode,
    required this.verificationId,
  });
}

class OnPhoneAuthErrorEvent extends LoginEvents{
  final String error;
 OnPhoneAuthErrorEvent({
  required this.error,
 });
}

class OnPhoneAuthVerificationCompletedEvent extends LoginEvents{
  final AuthCredential credential;

  OnPhoneAuthVerificationCompletedEvent({
  required this.credential
  });
}