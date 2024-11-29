import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workapp/Screens/HomePage/home_screen.dart';
import 'package:workapp/Screens/LoginPage/log_in_page.dart';
import 'package:workapp/local_storage/shared_helper.dart';

import '../../Styles/Color/appTheme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print("login status = ${MySharedPref.getLoginStatus()}");
    Timer(
      const Duration(seconds: 4),
      () {

        if (MySharedPref.getLoginStatus() == true) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (Route<dynamic> route) => false);


        } else {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LogInPage()),
                  (Route<dynamic> route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorDark,
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              height: 300,
              width: 400,
              // decoration: BoxDecoration(
              //   color: Color(0xFFf8f7ff),
              //   borderRadius: BorderRadius.circular(15),
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.black.withOpacity(0.2),
              //       offset: Offset(5, 5),
              //       blurRadius: 15,
              //     ),
              //     BoxShadow(
              //       color: Colors.white.withOpacity(0.7),
              //       offset: Offset(-5, -5),
              //       blurRadius: 15,
              //     ),
              //   ],
              // ),
              duration: Duration(milliseconds: 2),
              child: Center(
                child: Image.asset(
                  "assets/images/splashImage.png",
                  height: 250,
                  width: 400,
                ),
              ),
              // clipBehavior: Clip.values(Cl),
            ),
            const SizedBox(height: 15),
            const Text(
              "HSM Tracker",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'RobotoSlab',
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
