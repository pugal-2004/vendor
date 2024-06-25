import 'package:flutter/material.dart';
import 'package:koyambedu/screens/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              children: [
                const Icon(Icons.image_search_outlined,
                size: 250,
                ),
                const SizedBox(height: 30,),
                const Text("Let's get started",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,

                ),
                ),
                const SizedBox(height: 40,),


                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: const Size(180,60),
               
                ),
                 child: const Text("click",
                 style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                 ),
                 )
                 ),

                
              ],
            ),
          ),
          
        )
      ),
    );
  }
}