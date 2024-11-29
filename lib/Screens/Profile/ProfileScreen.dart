import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:workapp/Screens/Profile/privacyPolicy.dart';
import 'package:workapp/Screens/Profile/settingPage.dart';
import 'package:workapp/Screens/LoginPage/log_in_page.dart';
import '../../Styles/Color/appTheme.dart';
import '../Drawer/navigation_drawer.dart';
import 'EditProfile.dart';
import 'ProfileMenuWidget.dart';
import 'aboutUs.dart';
import 'changePassword.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = EdgeInsets.symmetric(horizontal: size.width * 0.05);

    return Scaffold(
      drawer: NavigationDrawerClass(),
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'RobotoSlab',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.backgroundColorDark,
      ),
      backgroundColor: AppColors.backgroundColorDark,
      body: SingleChildScrollView(
        child: Padding(
          padding: padding,
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 180,
                        height: 110,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset("assets/images/applogo.png"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                style: TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                "Anup Tarone",
              ),
              const Text(
                "Flutter Developer",
                style: TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 170,
                child: ElevatedButton(
                  style: ButtonStyle(
                    side: WidgetStateProperty.all<BorderSide>(BorderSide.none),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    backgroundColor:
                        WidgetStateProperty.all<Color>(AppColors.buttonColor),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const EditUpdateProfileScreen()));
                  },
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle("Personal Information"),
              _buildInfoContainer(
                children: [
                  ProfileMenuWidget(
                      title: "Settings",
                      icon: Icons.settings,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingPage()));
                      },
                      endIcon: true),
                  const Divider(color: AppColors.backgroundColor),
                  ProfileMenuWidget(
                      title: "Change Password",
                      icon: Icons.lock,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChangePassword()));
                      },
                      endIcon: true),
                ],
              ),
              const SizedBox(height: 20),
              _buildSectionTitle("Utilities"),
              _buildInfoContainer(
                children: [
                  ProfileMenuWidget(
                      title: "About Us",
                      icon: Icons.info,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutUs()));
                      },
                      endIcon: true),
                  const Divider(color: AppColors.backgroundColor),
                  ProfileMenuWidget(
                      title: "Policy",
                      icon: Icons.policy,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PrivacyPolicy()));
                      },
                      endIcon: true),
                  const Divider(color: AppColors.backgroundColor),
                  ProfileMenuWidget(
                    title: "Log Out",
                    icon: Icons.logout,
                    textColor: Colors.redAccent,
                    endIcon: false,
                    // onPress: ()=> Get.defaultDialog(
                    //   custom: testWidget()
                    // )
                    onPress: () {
                      Get.defaultDialog(
                        title: 'Logout',
                        middleText: 'Are you sure you want to log out?',
                        textCancel: 'No',
                        textConfirm: 'Yes',
                        onConfirm: () {
                          Get.back(); // Close the dialog
                          Get.to(LogInPage()); // Navigate to Login Page
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'RobotoSlab',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoContainer({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }



  Widget testWidget() {
    return AlertDialog(
      title: const Text(
        "Logout",
        style: TextStyle(
          fontFamily: 'RobotoSlab',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
        "Are yoe sure you want to log out?",
        style: TextStyle(
          fontFamily: 'RobotoSlab',
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "No",
              style: TextStyle(
                fontFamily: 'RobotoSlab',
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            )),
        TextButton(
            onPressed: () {
              Get.back();
              Get.to(LogInPage());
            },
            child: const Text(
              "Yes",
              style: TextStyle(
                fontFamily: 'RobotoSlab',
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ))
      ],
    );
  }
}
