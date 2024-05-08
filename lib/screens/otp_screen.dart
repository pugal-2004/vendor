import 'package:flutter/material.dart';
import 'package:koyambedu/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {

  final String verificationId;
  const OtpScreen({super.key,
  required this.verificationId
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
          child: Column(
            children: [
              Align(
               alignment: Alignment.topLeft,
               child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.arrow_back),
               ),
              ),
             const  Icon(Icons.image_search,
              size: 200,
              ),
              const SizedBox(height: 10,),
              const Text("Verification",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text("Enter the OTP sended",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20,),
              Pinput(
                length: 6,
                showCursor: true,
                defaultPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.purple)
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  )
                ),
                onSubmitted: (value){
                  setState(() {
                    otpCode = value;
                  });
                },
              ),
              const SizedBox(height: 25,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: CustomButton(text: "Verify",
                 onPressed: (){}
                 ),

              ),

              const SizedBox(height: 25,),
              const Text("Didn't recieve code?",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
              ),
              const SizedBox(height: 25,),
              const Text("Resend Now",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.purple
              ),
              ),
            ],
            ),
            ),
            ),
            ),
            );
  }
}

//verify OTP

