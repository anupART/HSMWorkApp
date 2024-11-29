import 'package:flutter/material.dart';
import 'package:workapp/Screens/Profile/text.dart';

import '../../Styles/Color/appTheme.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          "About Us",
          style: TextStyle(
            fontFamily: 'RobotoSlab',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  "images/aboutUs.png",
                  height: 300,
                  width: MediaQuery.of(context).size.width / 1.1,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Our Story",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      TextString.ourStory,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 5,
                    endIndent: 15,
                    indent: 15,
                    color: AppColors.backgroundColor,
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Our Purpose",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      TextString.ourPurpose,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Our Team",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RobotoSlab',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      TextString.ourTeam,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    thickness: 5,
                    endIndent: 15,
                    indent: 15,
                    color: AppColors.backgroundColor,
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Join Us",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RobotoSlab',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      TextString.joinUss,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Contact Us: anup@gmkail.com\nPhone:+91 123456789 \nAddress: 123 Flutter St, 45 Mobile City",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'RobotoSlab',
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
