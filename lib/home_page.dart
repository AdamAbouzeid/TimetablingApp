import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("Adam's Timetabling App"),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login_page');
                  },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.red
                    ),
                  child: const Text('Login')
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'signup_page');
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.red
                    ),
                  child: const Text('Sign Up')
                ),
              ]),
        ));
  }
}