import 'package:flutter/material.dart';
import 'package:workapp/Screens/Profile/text.dart';
import '../../Styles/Color/appTheme.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          "Privacy Policy",
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
                  "images/policy.png",
                  height: 300,
                  width: MediaQuery.of(context).size.width / 1.1,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 180,
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
                      "Our Policy",
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
                      TextString.intro,
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
                      "Personal Information",
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
                      TextString.personalInfo,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        fontSize: 12,
                        color: Colors.white,
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
                      "Non Personal Information",
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
                      TextString.nonPersonalInfo,
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
                  "Contact Us: email@example.com\nPhone: +123 456 7890\nAddress: 123 Flutter St, Mobile City",
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
