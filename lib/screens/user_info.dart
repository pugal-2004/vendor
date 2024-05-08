import 'dart:io';

import 'package:flutter/material.dart';
import 'package:koyambedu/Utils/Utils.dart';
import 'package:koyambedu/model/user_model.dart';
import 'package:koyambedu/provider/auth_provider.dart';
import 'package:koyambedu/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {

File? image;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();

@override
void dispose(){
  super.dispose();
  nameController.dispose();
  emailController.dispose();
  bioController.dispose();
}


//select image
void selectImage() async{
  image = await pickImage(context);
  setState(() {});
}


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
          child:  Center(
            child: Column(children: [
                  InkWell(
                    onTap: ()=> selectImage(),
                    child: image == null? const CircleAvatar(
                      backgroundColor: Colors.pink,
                      radius: 50,
                      child: Icon(Icons.account_circle,
                      size: 50,
                      color: Colors.white,
                      ),
                    )
                    : CircleAvatar(
                      backgroundImage: FileImage(image!),
                      radius: 50,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 5 , horizontal: 15),
                    margin:  const EdgeInsets.only(top: 20),
                    child:  Column(
                      children: [
                        //name field
                        textFeld(
                          hintText: "name",
                         icon: Icons.account_circle,
                          inputType: TextInputType.name,
                           maxLines: 1,
                            controller: nameController
                            ),
                        //email
                        textFeld(
                          hintText: "enter emailID",
                         icon: Icons.email,
                          inputType: TextInputType.name,
                           maxLines: 1,
                            controller: emailController
                            ),
                        //you shop bio
                        textFeld(
                          hintText: "description",
                         icon: Icons.edit,
                          inputType: TextInputType.name,
                           maxLines: 2,
                            controller: bioController
                            ),
                      ],
                    ),

                  ),
                  const SizedBox(height: 20,),

                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width ,
                    child: CustomButton(text: "continue",
                     onPressed: ()=> storeData(),
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
  Widget textFeld({required String hintText, 
  required IconData icon ,
   required TextInputType inputType,
    required int maxLines,
   required TextEditingController controller })
   {
    return  Padding(padding: const  EdgeInsets.only(bottom: 10),
    child: TextFormField(
      cursorColor: Colors.purple,
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: Container(
          margin:const EdgeInsets.all(8.0) ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon, 
            size: 28,

            color: Colors.purple

          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const  BorderSide(color: Colors.transparent)
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const  BorderSide(color: Colors.transparent)
        ),
        hintText: hintText,
        alignLabelWithHint: true,
        border: InputBorder.none,
        fillColor: Colors.purple.shade50,
        
        filled: true,

      ),

    ),
    );
  }
  void storeData ()async{
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel
    (name: nameController.text.trim(), 
    email: emailController.text.trim(),
     bio: bioController.text.trim(), 
     phoneNumber: "", 
     profilePic: "", 
     creditAt: "",
      uid: ""
      );
      if (image!=null){


      }else{
        showSnackBar(context, "please upload your photo");
      }
  }
}