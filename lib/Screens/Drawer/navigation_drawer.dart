// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:workapp/Screens/HomePage/home_screen.dart';
// import 'package:workapp/Screens/Notes/notes_page.dart';
// import 'package:workapp/Screens/Profile/ProfileScreen.dart';
// import 'package:workapp/Screens/Profile/settingPage.dart';
// import 'package:workapp/Screens/Project/projectList.dart';
// import 'package:workapp/Screens/Task/taskList.dart';
// import 'package:workapp/Styles/Color/appTheme.dart';
//
// import '../LoginPage/log_in_page.dart';
//
// class NavigationDrawerClass extends StatelessWidget {
//   final ProfileScreen pro = ProfileScreen();
//
//   NavigationDrawerClass({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       shadowColor: AppColors.backgroundColorDark,
//       elevation: 3,
//       backgroundColor: AppColors.backgroundColor,
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             buildHeader(context),
//             buildMenuItems(context),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildHeader(BuildContext context) {
//     return Container(
//       height: 150,
//       color: AppColors.buttonColor,
//       padding: const EdgeInsets.all(16.0),
//       child: GestureDetector(
//         onTap: ()=>Get.to(ProfileScreen(),),
//         child: const Row(
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundColor: Colors.black,
//               backgroundImage: AssetImage("assets/images/applogo.png"),
//             ),
//             SizedBox(width: 12),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Name',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   'Flutter Fucking Drawer',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildMenuItems(BuildContext context) {
//     return Wrap(
//       runSpacing: 20, // vertical spacing
//       children: [
//         ListTile(
//           leading: Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 color: AppColors.buttonColor.withOpacity(0.2),
//               ),
//               child: const Icon(
//                 Icons.home_outlined,
//                 size: 24,
//                 color: Colors.black,
//               )),
//           title: const Text('Home'),
//           onTap: () {
//             Get.to(const HomeScreen());
//           },
//         ),
//         ListTile(
//           leading: Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 color: AppColors.buttonColor.withOpacity(0.2),
//               ),
//               child: const Icon(
//                 Icons.task_outlined,
//                 size: 24,
//                 color: Colors.black,
//               )),
//           title: const Text('Task'),
//           onTap: () {
//             Get.to(TasklistClass());
//           },
//         ),
//         ListTile(
//           leading: Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 color: AppColors.buttonColor.withOpacity(0.2),
//               ),
//               child: const Icon(
//                 Icons.task_alt_rounded,
//                 size: 24,
//                 color: Colors.black,
//               )),
//           title: const Text('Project'),
//           onTap: () {
//             Get.to(ProjectList());
//           },
//         ),
//         ListTile(
//           leading: Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 color: AppColors.buttonColor.withOpacity(0.2),
//               ),
//               child: const Icon(
//                 Icons.message_outlined,
//                 size: 24,
//                 color: Colors.black,
//               )),
//           title: const Text('Chats'),
//           onTap: () {
//          //   Get.to(ProjectList());
//           },
//         ),
//         ListTile(
//           leading: Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 color: AppColors.buttonColor.withOpacity(0.2),
//               ),
//               child: const Icon(
//                 Icons.ac_unit,
//                 size: 24,
//                 color: Colors.black,
//               )),
//           title: const Text('Leaves'),
//           onTap: () {
//         //    Get.to(ProjectList());
//           },
//         ),
//         ListTile(
//           leading: Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 color: AppColors.buttonColor.withOpacity(0.2),
//               ),
//               child: const Icon(
//                 Icons.notes_sharp,
//                 size: 24,
//                 color: Colors.black,
//               )),
//           title: const Text('Quick Notes'),
//           onTap: () {
//             Get.to(NotesPage());
//           },
//         ),
//         ListTile(
//           leading: Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 color: AppColors.buttonColor.withOpacity(0.2),
//               ),
//               child: Center(
//                   child: const Icon(
//                 Icons.developer_board,
//                 size: 24,
//                 color: Colors.black,
//               ))),
//           title: const Text('Notice'),
//           onTap: () {
//             Get.to(NotesPage());
//           },
//         ),
//         ListTile(
//           leading: Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 color: AppColors.buttonColor.withOpacity(0.2),
//               ),
//               child: const Icon(
//                 Icons.calendar_today,
//                 size: 24,
//                 color: Colors.black,
//               )),
//           title: const Text('Calender'),
//           onTap: () {
//             Get.to(ProjectList());
//           },
//         ),
//         const Divider(
//           color: AppColors.backgroundColorDark,
//           thickness: 4,
//         ),
//         ListTile(
//           leading: Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 color: AppColors.buttonColor.withOpacity(0.2),
//               ),
//               child: const Icon(
//                 Icons.settings,
//                 size: 24,
//                 color: Colors.black,
//               )),
//           title: const Text('Setting'),
//           onTap: () {
//             Get.to(SettingPage());
//           },
//         ),
//         ListTile(
//           leading: Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 color: AppColors.buttonColor.withOpacity(0.2),
//               ),
//               child: const Icon(
//                 Icons.person,
//                 size: 24,
//                 color: Colors.black,
//               )),
//           title: const Text('Log Out'),
//           onTap: () {
//             Get.defaultDialog(
//               title: 'Logout',
//               middleText: 'Are you sure you want to log out?',
//               textCancel: 'No',
//               textConfirm: 'Yes',
//               backgroundColor: AppColors.backgroundColor,
//               titleStyle: TextStyle(color: Colors.black),
//               middleTextStyle: TextStyle(color: Colors.black),
//               cancelTextColor: Colors.black,
//               confirmTextColor: Colors.black,
//               buttonColor: AppColors.buttonColor,
//               barrierDismissible: false,
//               onConfirm: () {
//                 Get.back(); // Close the dialog
//                 Get.to(LogInPage()); // Navigate to Login Page
//               },
//             );
//           },
//         ),
//       ],
//     );
//   }
// //
// // Widget showingDialog(){
// //   return pro.testWidget();
// // }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workapp/Screens/HomePage/home_screen.dart';
import 'package:workapp/Screens/Notes/notes_page.dart';
import 'package:workapp/Screens/Profile/ProfileScreen.dart';
import 'package:workapp/Screens/Profile/settingPage.dart';
import 'package:workapp/Screens/Project/projectList.dart';
import 'package:workapp/Screens/Task/taskList.dart';
import 'package:workapp/Styles/Color/appTheme.dart';
import 'package:workapp/local_storage/shared_helper.dart';


import '../Leaves/leave_page.dart';
import '../LoginPage/log_in_page.dart';
import '../calender/calender_page.dart';
import 'navbar_setting.dart';

class NavigationDrawerClass extends StatelessWidget {
  final ProfileScreen pro = ProfileScreen();

  NavigationDrawerClass({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(

        width: Get.size.width/1.3,
        shadowColor: AppColors.backgroundColorDark,
        elevation: 3,
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      height: 160,
      color: AppColors.buttonColor,
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          Get.off(const ProfileScreen());
        },
        child: const Row(
          children: [
            SizedBox(height: 60,),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
              backgroundImage: AssetImage("assets/images/applogo.png"),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5,),
                Flexible(

                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    'Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoSlab',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Flexible(
                  child: Wrap(
                    children:[ Text(
                      overflow: TextOverflow.ellipsis,
                      'Flutter  Drawer',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RobotoSlab',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Wrap(
      runSpacing: 20, // vertical spacing
      children: [
        ListTile(
          leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.buttonColor.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.home_outlined,
                size: 24,
                color: Colors.black,
              )),
          title: const Text('Home'),
          onTap: () {
            Navigator.pop(context);
            Get.off(const HomeScreen());
          },
        ),
        ListTile(
          leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.buttonColor.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.task_outlined,
                size: 24,
                color: Colors.black,
              )),
          title: const Text('Task'),
          onTap: () {
            Navigator.pop(context);
            Get.off(TasklistClass());
          },
        ),
        ListTile(
          leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.buttonColor.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.task_alt_rounded,
                size: 24,
                color: Colors.black,
              )),
          title: const Text('Project'),
          onTap: () {
            Navigator.pop(context);
            Get.off(const ProjectList());
          },
        ),
        ListTile(
          leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.buttonColor.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.message_outlined,
                size: 24,
                color: Colors.black,
              )),
          title: const Text('Chats'),
          onTap: () {
            //   Get.off(ProjectList());
          },
        ),
        ListTile(
          leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.buttonColor.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.ac_unit,
                size: 24,
                color: Colors.black,
              )),
          title: const Text('Leaves'),
          onTap: () {
            Navigator.pop(context);
            Get.off(LeavePage());
          },
        ),
        ListTile(
          leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.buttonColor.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.sticky_note_2_sharp,
                size: 24,
                color: Colors.black,
              )),
          title: const Text('Quick Notes'),
          onTap: () {
            Navigator.pop(context);
            Get.off(NotesPage());
          },
        ),
        ListTile(
          leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.buttonColor.withOpacity(0.2),
              ),
              child: const Center(
                  child: Icon(
                    Icons.developer_board,
                    size: 24,
                    color: Colors.black,
                  ))),
          title: const Text('Notice'),
          onTap: () {
            Navigator.pop(context);
            Get.off(NotesPage());
          },
        ),
        ListTile(
          leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.buttonColor.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.calendar_today,
                size: 24,
                color: Colors.black,
              )),
          title: const Text('Calender'),
          onTap: () {
            Navigator.pop(context);
            Get.off(CalendarPage());
          },
        ),
        const Divider(
          color: AppColors.backgroundColorDark,
          thickness: 4,
        ),
        ListTile(
          leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.buttonColor.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.settings,
                size: 24,
                color: Colors.black,
              )),
          title: const Text('Settings'),
          onTap: () {
            Navigator.pop(context);
            Get.off(const SettingPageDrawer());
          },
        ),
        ListTile(
          leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.buttonColor.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.person,
                size: 24,
                color: Colors.black,
              )),
          title: const Text('Log Out'),
          onTap: () {
            Get.defaultDialog(
              title: 'Logout',
              middleText: 'Are you sure you want to log out?',
              textCancel: 'No',
              textConfirm: 'Yes',
              backgroundColor: AppColors.backgroundColor,
              titleStyle: const TextStyle(color: Colors.black),
              middleTextStyle: const TextStyle(color: Colors.black),
              cancelTextColor: Colors.black,
              confirmTextColor: Colors.black,
              buttonColor: AppColors.buttonColor,
              barrierDismissible: false,
              onConfirm: () {
                Get.back(); // Close the dialog
                MySharedPref.clear();
                Get.off(const LogInPage()); // Navigate to Login Page
              },
            );
          },
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}
