// @dart=2.9
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'calendar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'home_page',
      routes: {
        'home_page': (context) => HomePage(),
        'login_page': (context) => LoginPage(),
        'signup_page': (context) => SignupPage(),
        'calendar': (context) => Calendar()
      },
    );
  }
}
