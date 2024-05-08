import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:koyambedu/Utils/Utils.dart';
import 'package:koyambedu/screens/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier{
  bool _isSignedIn = false ;
  bool get isSignedIn => _isSignedIn;
    bool _isLoading  = false ;
  bool get isLoading => _isLoading;
  String? _uid;
   String get uid => _uid!;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  AuthProvider(){
    checkSign();
    
  }

  void checkSign() async{
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("is_signedin") ?? false;
    notifyListeners();
  }

void signInWithPhone(BuildContext context, String phoneNumber)async{
  try{
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async{
        await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        
      },
     verificationFailed: (error){
      throw Exception(error.message);
     },
      codeSent: ((verificationId, forceResendingToken) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> OtpScreen(verificationId: verificationId)));
      }),
       codeAutoRetrievalTimeout: (verificationId){},
       );

  } on FirebaseAuthException catch(e){
    showSnackBar(context, e.message.toString());
  }
}


//verify otp

void verifyOtp({
  required BuildContext context,
  required String verificationId,
  required String userOtp,
  required Function onSuccess,

}) async{
  _isLoading = true;
  notifyListeners();
  try{
    PhoneAuthCredential creds = PhoneAuthProvider.credential(
      verificationId: verificationId,
     smsCode: userOtp,
     );
     User user = (await _firebaseAuth.signInWithCredential(creds)).user!;
     if (user != null){
      //hold my brain logic
      _uid = user.uid;

      onSuccess();
     }

  }on FirebaseAuthException catch(e){
    showSnackBar(context, e.message.toString());
  }
}

//DAtabase operation

Future<bool> checkExisitingUser() async {
  DocumentSnapshot snapshot  = await _firebaseFirestore.collection("user").doc(_uid).get();
  if (snapshot.exists){
    print ("user exist");
    return true;
  }else{
    print("new user");
    return false;
  }
}
}



