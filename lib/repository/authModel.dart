import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthModel{
  FirebaseAuth authentication = FirebaseAuth.instance;
  User? firebaseUser;
  FirebaseFirestore database = FirebaseFirestore.instance;

  Future<void> loginWithPhone({
    required String phonNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function( String , int? )codeSent,
    required Function(String) codeAutoRetrivalTimeout, required Null Function(String verificationId) codeAutoRetrievalTimeout

  }) async{
    await authentication.verifyPhoneNumber(
      verificationCompleted: verificationCompleted, 
    verificationFailed: verificationFailed,
     codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrivalTimeout);
  }
}