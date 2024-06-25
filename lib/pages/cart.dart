import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("cart",
     style:TextStyle(
       fontSize: 18,
      fontWeight: FontWeight.bold,
     )
      ),
    );
  }
}