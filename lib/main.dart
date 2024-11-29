import 'package:flutter/material.dart';
import 'package:workapp/local_storage/shared_helper.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:workapp/Getx/all_bindings.dart';
import 'package:workapp/Screens/HomePage/home_screen.dart';
import 'package:workapp/Screens/Project/projectList.dart';

import 'Screens/Profile/ProfileScreen.dart';
import 'Screens/SplashScreen/splash_screen.dart';
import 'Screens/Task/taskList.dart';
// import 'package:workapp/screen/home_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MySharedPref.init();
  runApp(const WorkApp());
}
class WorkApp extends StatelessWidget {
  const WorkApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Work App',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffe2eafc),
          primarySwatch: Colors.blue,
          inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              errorStyle: TextStyle(height: 0),
              border: defaultInputBorder,
              enabledBorder: defaultInputBorder,
              focusedBorder: defaultInputBorder,
              errorBorder: defaultInputBorder),
      ),
      initialBinding: AllBindings(),
      // home:  EntryPoint()
      // home:  TasklistClass()
      // home: const ProjectList (),
      // home: const ProfileScreen(),
      // home: const EditUpdateProfileScreen(),
      // home: ChatClass(),
      home: HomeScreen(),
      // home: SplashScreen(),
      // home: NotesPage(),
      // home: CalendarPage(),
    );
  }
}
const defaultInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.black54,
    width: 1
  ),
  borderRadius: BorderRadius.all(Radius.circular(16))
);

