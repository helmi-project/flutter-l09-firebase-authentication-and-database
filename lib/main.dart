import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home.dart';
import 'new_account.dart';
import 'login.dart';
import 'service.dart';
import 'my_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        'Login': (context) => Login(),
        'NewAccount': (context) => NewAccount(),
        'Service': (context) => Service(),
        'Home': (context) => Home(),
        'Firestore': (context) => MyCloud(),
      },
    );
  }
}
