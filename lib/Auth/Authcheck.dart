import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:koyambedu/features/homepage.dart';
import 'package:koyambedu/screens/welcome_screen.dart';



class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot)  {
          //user logged In 
          if (snapshot.hasData){
            return const  HomePage();
          }else{
            return  const WelcomeScreen();
          }

          
        },
      ),
    );
  }
}