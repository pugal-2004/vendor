import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  final String title;
  final VoidCallback onTap;


   RoundButton({super.key,
   required this.title,
   required this.onTap, required bool loading
   });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10)
        ),
        child:  Center(child: Text(title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),
        ),),
      
      ),
    );
  }
}