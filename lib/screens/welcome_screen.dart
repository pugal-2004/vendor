import 'package:flutter/material.dart';
import 'package:koyambedu/pages/home_page.dart';
import 'package:koyambedu/provider/auth_provider.dart';
import 'package:koyambedu/screens/register_screen.dart';
import 'package:koyambedu/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context , listen:false);
    return Scaffold(
      body:  SafeArea(
        child:  Center(
          child: Padding(padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Icon(Icons.add_photo_alternate_outlined,
              size: 280,
              ),
              const SizedBox(height: 10,),
              const Text("Lets get started",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text("Never a better time than now to start",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20,),
              //custom_btn
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(text: "Get Started",
                 onPressed: (){

                  ap.isSignedIn == true //when true fetch data
                  ? 
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const MyHomePage()))

                  : Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const RegisterScreen()
                    ),

                    );
                 }
                 ),
              )
            ],
          ),
          ),

        ),
      ),
    );
  }
}