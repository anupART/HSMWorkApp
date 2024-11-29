import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workapp/Screens/ForgetPassword/forget_password_page.dart';
import 'package:workapp/Screens/HomePage/home_screen.dart';
import 'package:workapp/Styles/Color/appTheme.dart';
import 'package:workapp/local_storage/shared_helper.dart';
import 'login_model.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String LOGINKEY = "isLogin";
  bool? isLogin = false;

  void login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(LOGINKEY, true);
    Get.to(const HomeScreen());
  }

  void logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(LOGINKEY, false);
  }

  Future<bool> loginUser() async {
    var url = "https://work-management-ashen.vercel.app/api/userLogin";
    var data = {"email": email.text, "password": password.text};
    var body = json.encode(data);
    var urlParse = Uri.parse(url);
    http.Response response = await http.post(
      urlParse,
      body: body,
      headers: {"Content-Type": "application/json"},
    );
    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      // Parse the response body
      var responseData = json.decode(response.body);
      var loginModel = LoginModel.fromJson(responseData);
      if (loginModel.success == 1) {
        print('Login successful');
        print('Response data: ${loginModel.msg}');
        return true; // Indicate success
      } else {
        print('Login failed: ${loginModel.msg}');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login failed: ${loginModel.msg}')));
        return false;
      }
    } else {
      print('HTTP Error: ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('HTTP Error: ${response.statusCode}')));
      return false;
    }
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorDark,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: Get.size.width,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(5, 5),
                    blurRadius: 15,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.7),
                    offset: Offset(-5, -5),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: const Center(
                  child: Image(
                image: AssetImage("assets/images/loginImage1.png"),
                fit: BoxFit.cover,
                // image: NetworkImage('https://img.freepik.com/free-vector/3d-cartoon-style-checklist-with-green-checkmark-icon-list-with-completed-tasks-white-background-flat-vector-illustration-success-productivity-management-achievement-concept_778687-983.jpg?t=st=1722579216~exp=1722582816~hmac=0c314a78991b1db57eacfb7d13b37b92dc5d3e4d1996d3f9884d295543602018&w=826') ,
              )),
            ),
            const SizedBox(height: 10),
            const Center(
                child: Text(
              "SIGN IN",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )),
            const Center(
                child: Text(
              "Please Sign in to continue",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'RobotoSlab',
                fontSize: 16,
              ),
            )),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                controller: email,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: AppColors.buttonColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: AppColors.buttonColor, width: 2),
                  ),
                  filled: true,
                  fillColor: Color(0xffF8F7FF),
                  border: OutlineInputBorder(),
                  labelText: 'Email ',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                controller: password,
                style: const TextStyle(color: Colors.black),
                // obscureText: true,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: AppColors.buttonColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: AppColors.buttonColor, width: 2),
                  ),
                  filled: true,
                  fillColor: Color(0xffF8F7FF),
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter secure password',
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 2),
                  GestureDetector(
                    onTap: () {
                      Get.to(ForgotPasswordPage());
                    },
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RobotoSlab',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RobotoSlab',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    bool loginSuccess = await loginUser();
                    if (loginSuccess) {
                      MySharedPref.setLoginStatus(true);
                      print("login status: ${MySharedPref.getLoginStatus()}");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}

//25,=> AppBar 22=>Heading, 20=>Button , 16=>Text ,















