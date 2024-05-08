import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:koyambedu/provider/auth_provider.dart';
import 'package:koyambedu/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController PhoneController = TextEditingController();

  Country selectedCountry = Country(
    phoneCode: "91", 
    countryCode: "IN", 
    e164Sc: 0,
     geographic: true,
      level: 1,
       name: "India", 
       example: "India",
        displayName: "India",
         displayNameNoCountryCode: "IN",
          e164Key: "",
          );



  @override
  Widget build(BuildContext context) {

    PhoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: PhoneController.text.length,
      ),
    );

    return SingleChildScrollView(
      child: Scaffold(
        body: SafeArea(child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              children: [
               const  Icon(Icons.image_search,
                size: 200,
                ),
                const SizedBox(height: 10,),
                const Text("Register",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text("Add your to Number for OTP",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  cursorColor: Colors.purple,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                  controller: PhoneController,
                  onChanged: (value){
                    setState((){
                      PhoneController.text = value;
      
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter the phone number",
                    helperStyle: const TextStyle(fontWeight: FontWeight.w400),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide( color: Colors.black)
                    ),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          showCountryPicker(context: context,
                          countryListTheme: const  CountryListThemeData(
                            bottomSheetHeight: 500,
                          ), 
                          onSelect: (value){
                            setState(() {
                              selectedCountry = value;
                            });
      
                          } );
                        },
                        child: Text(
                          "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    suffix: PhoneController.text.length>9 ? 
                    Container(
                      height: 30,
                      width: 30,
                     
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green
                      ),
                      child: const  Icon(Icons.done,
                      color: Colors.white,
                      size: 20,
      
                      ),
      
      
                    )
                    : null,
                  ),
                ),
                const SizedBox(height: 20,),
                
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    text: "Login", 
                  onPressed: ()=> sendPhoneNumber()
                  ),
                )
      
              
              ],
            ),
            ),
        ),
        ),
      ),
    );
  }

  void sendPhoneNumber(){
    //123456

    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = PhoneController.text.trim();
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }
}