import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/auth/google_signin.dart';
import 'package:news_app/screens/home_screen.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/news_logo.png",
            width: 200,
            height: 200,
          ),
          Container(
            width: 240,
            height: 40,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xFF4A2AE8)),
                onPressed: () {
                  signInWithGoogle().then((result) {
                    if (result != null) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }), ModalRoute.withName('/'));
                    } else {
                      AlertDialog(
                        title: Text("Login Error"),
                        content: ListBody(
                          children: [Text("An Error ocurred,please try again")],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Got it"))
                        ],
                      );
                    }
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      "assets/google_icon.svg",
                      width: 20,
                      height: 20,
                    ),
                    Text("Continue with Google")
                  ],
                )),
          ),
        ],
      ),
    ));
  }
}
