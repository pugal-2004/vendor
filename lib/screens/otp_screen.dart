

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:koyambedu/components/round_button.dart';
import 'package:koyambedu/components/utils.dart';
import 'package:koyambedu/pages/home.dart';

class OtpSCreen extends StatefulWidget {

final String verificationId ;

   OtpSCreen({super.key,
  required this.verificationId,
  });

  @override
  State<OtpSCreen> createState() => _OtpSCreenState();
}

class _OtpSCreenState extends State<OtpSCreen> {
bool loading = false;
final auth =FirebaseAuth.instance;
final verifyCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
       body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: verifyCodeController,
                  decoration: const InputDecoration(
                    hintText: "Enter the 6 digit"
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const  SizedBox(height: 40,),
              RoundButton(title: "verify",loading: loading,
              
              
              
               onTap:()async{

                setState(() {
                  loading = true;
                });

                final credential = PhoneAuthProvider.credential (
                  verificationId: widget.verificationId,
                   smsCode: verifyCodeController.text.toString(),
                   );
                   try{
                    await auth.signInWithCredential(credential);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                   }catch(e){
                    setState(() {
                  loading = false;
                });
                Utils().toastMessage(e.toString());


                   }

               }
               ),

              
            ],
          ),
        ),
      ),
    );
  }
}