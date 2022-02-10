import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inventory_management/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F52BA),
      body: Center(
        child: Container(
          child: Image.asset(
            'assets/logosplash.png',
            width: 214,
            height: 197,
          ),
        ),
      ),
    );
  }
}
