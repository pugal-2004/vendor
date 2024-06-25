import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:koyambedu/components/round_button.dart';
import 'package:koyambedu/components/utils.dart';
import 'package:koyambedu/screens/otp_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

bool loading = false;
final auth =FirebaseAuth.instance;
final PhoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: PhoneNumberController,
                  decoration: const InputDecoration(
                    hintText: "+91"
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const  SizedBox(height: 40,),
              RoundButton(title: "Login",loading: loading,
              
              
              
               onTap:(){

                setState(() {
                  loading = true;
                });


                

                auth.verifyPhoneNumber(
                    phoneNumber: PhoneNumberController.text,
                    verificationCompleted: (_){
                      setState(() {
                        loading = false;
                      });

                    },
                     verificationFailed: (e)
                     {
                       setState(() {
                        loading = false;
                      });
                      Utils().toastMessage(e.toString());

                     }, 
                     codeSent: (String verificationId , int?  toeken){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  OtpSCreen(verificationId: verificationId,)));
                    
                     setState(() {
                        loading = false;
                      });
                     },
                      codeAutoRetrievalTimeout: (e){
                        Utils().toastMessage(e.toString());

                         setState(() {
                        loading = false;
                      });
                      }
                      );
               }
               ),

              
            ],
          ),
        ),
      ),
      
    );
  }
}