
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:koyambedu/features/homepage.dart';
import 'package:koyambedu/pages/cart.dart';
import 'package:koyambedu/pages/info.dart';
import 'package:koyambedu/pages/person.dart';

class CurvedPage extends StatefulWidget  {
  const CurvedPage({super.key});


 
  @override
  State<CurvedPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CurvedPage> {

  int  _CurrentIndex = 0;

 final List  <Widget> _pages = [
  HomePage(),
  InfoPage(),
  PersonPage(),
  CartPage(),

 ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor:  Colors.red,
        
        color: Colors.red.shade300,
        
        
        items: [
          Icon(Icons.home,
          size: 35,
          
          ),
          Icon(Icons.person_pin,
          size: 35,
          ),
          Icon(Icons.info_outline_rounded,
          size: 35,
          ),
          Icon(Icons.shopping_cart,
          size: 35,
          ),
          
        ],
        index: _CurrentIndex,
        onTap: (index){
          setState(() {
            _CurrentIndex = index;
          });
        },
        ),
      
      body: 
      _pages[_CurrentIndex],

    );
  }
}