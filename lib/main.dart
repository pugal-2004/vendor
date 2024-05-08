import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:koyambedu/firebase_options.dart';
import 'package:koyambedu/provider/auth_provider.dart';
import 'package:koyambedu/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=> AuthProvider())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
            title: "FlutterPhoneAuth",
        home: WelcomeScreen(),
      ),
    );
  }
}


