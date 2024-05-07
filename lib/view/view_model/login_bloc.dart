import 'dart:js_util';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koyambedu/repository/authModel.dart';
import 'package:koyambedu/view/view_model/login_event.dart';
import 'package:koyambedu/view/view_model/login_states.dart';

class LoginBloc extends Bloc<LoginEvents,LoginState>{
  String loginResult ='';
  AuthModel authModel = AuthModel();
  UserCredential? userCredential;
  LoginBloc (super.initialState){
    on<SendOtpToPhoneEvent>((event, emit) async {

      emit(LoginScreenLoadingState());
      try{
        await  authModel.loginWithPhone(
          phonNumber: event.number, 
          verificationCompleted: (PhoneAuthCredential credentials
           ){
            add(OnPhoneAuthVerificationCompletedEvent(credential: credentials));
           }, 
          verificationFailed: (FirebaseAuthException e){
            add(OnPhoneAuthErrorEvent(error: e.toString()));
          }, 
          codeSent: (String verificationId, int? refreshToken){
            add(OnPhoneOtpSend(verificationId: verificationId, token: refreshToken));
          }, 
          codeAutoRetrivalTimeout: (String verificationId){});
      }catch(e){
        emit(LoginScreenErrorState(error: e.toString()));
      }
    });

    on<OnPhoneOtpSend>((event, emit) {
      emit (PhoneAuthCodeSentSuccess(verificationId: event.verificationId));
      
    });
    
    on<VerifySentOtp>((event, emit) {
      try{
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: event.verificationId, smsCode: event.otpCode,);
         add( OnPhoneAuthVerificationCompletedEvent(credential: credential));
      }catch(e){
        emit(LoginScreenErrorState(error: e.toString()));
      }

    });
    on<OnPhoneAuthErrorEvent>((event, emit) {
      emit(LoginScreenErrorState(error: event.error.toString()));
    });

    on<On>((event, emit) => null)

  }
  
}