import 'package:flutter/material.dart';
import 'package:maan_application_2/ui/home/ui/home_page.dart';

class SplashScreen extends StatelessWidget {
  static final routeName = 'splashScreen';
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
              width: 130,
              height: 130,
              child: Image.asset('assets/images/logo.PNG')),
        ));
  }
}
