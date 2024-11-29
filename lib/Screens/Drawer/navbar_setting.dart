import 'package:flutter/material.dart';

import '../../Styles/Color/appTheme.dart';
import '../Profile/ProfileMenuWidget.dart';
import 'navigation_drawer.dart';
class SettingPageDrawer extends StatefulWidget {
  const SettingPageDrawer({super.key});

  @override
  State<SettingPageDrawer> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPageDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerClass(),
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text(
          "Setting",
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
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                _buildInfoContainer(
                  children: [
                    ProfileMenuWidget(
                        title: "Appearance",
                        icon: Icons.remove_red_eye,
                        onPress: () {},
                        endIcon: true
                    ),
                    const Divider(color: AppColors.backgroundColor),
                    ProfileMenuWidget(
                        title: "Notifications",
                        icon: Icons.notifications_active,
                        onPress: () {},
                        endIcon: true),
                    const Divider(color: AppColors.backgroundColor),
                    ProfileMenuWidget(
                        title: "Report a Bug",
                        icon: Icons.bug_report,
                        onPress: () {},
                        endIcon: true),
                    const Divider(color: AppColors.backgroundColor),
                    ProfileMenuWidget(
                        title: "Feedback",
                        icon: Icons.feedback,
                        onPress: () {},
                        endIcon: true),
                  ],
                ),
              ],
            ),
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

}