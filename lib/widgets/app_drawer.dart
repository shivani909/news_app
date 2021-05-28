import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/auth/google_signin.dart';
import 'package:news_app/screens/splash_screen.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Colors.black),
      accountName: Text(
        name,
        style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      accountEmail: Text(
        email,
        style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.normal),
      ),
      currentAccountPicture: ClipOval(
        child: Image.network(imageUrl),
      ),
    );

    final drawerItems = ListView(
      children: [
        drawerHeader,
        ListTile(
          title: Text(
            "Rate this App",
            style: GoogleFonts.roboto(fontSize: 15, color: Colors.white),
          ),
          leading: const Icon(
            Icons.thumb_up_off_alt,
            color: Colors.white,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            "Help and Feedback",
            style: GoogleFonts.roboto(fontSize: 15, color: Colors.white),
          ),
          leading: const Icon(
            Icons.help_outline,
            color: Colors.white,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            "Sign Out",
            style: GoogleFonts.roboto(fontSize: 15, color: Colors.white),
          ),
          leading: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          onTap: () {
            signOutGoogle();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
              return SplashView();
            }), ModalRoute.withName('/'));
          },
        ),
      ],
    );
    return Container(
      child: drawerItems,
    );
  }
}
