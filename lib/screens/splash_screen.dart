import 'package:flutter/material.dart';
import 'package:news_app/screens/login_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateAfterSeconds: LoginView(),
      seconds: 1,
      loaderColor: Colors.red,
      photoSize: 100,
      backgroundColor: Colors.white,
      image: new Image.asset("assets/images/news_logo.png"),
    );
  }
}
