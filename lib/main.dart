import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:localizer/firebase_options.dart';
import 'package:localizer/home/home_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Localizer',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
      ),
      home: const HomeScreen(),
    );
  }
}
