import 'package:flutter/material.dart';

import '../../Styles/Color/appTheme.dart';
import '../BottomNavBar/bottom_nav.dart';
import '../Drawer/navigation_drawer.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      drawer: NavigationDrawerClass(),
      bottomNavigationBar: BottomNav(),
      appBar: AppBar(
        titleSpacing: 0,
        title: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Leaves",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'RobotoSlab',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: AppColors.backgroundColorDark,
      ),
      floatingActionButton: FloatingActionButton(
        hoverElevation: 10,
        hoverColor: AppColors.buttonColor,
        backgroundColor: AppColors.unselectedButtonColor,
        onPressed: () {},
        tooltip: 'Add Note',
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
