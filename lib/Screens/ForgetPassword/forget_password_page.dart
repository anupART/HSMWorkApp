import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:workapp/Screens/ForgetPassword/set_new_password_page.dart';
import 'package:workapp/Styles/Color/appTheme.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> recoverPassword() async {
    final String email = _emailController.text;

    // Replace with your API endpoint
    final Uri apiUrl = Uri.parse('https://example.com/api/recover_password');

    final response = await http.post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Recovery email sent')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send recovery email')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorDark,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor:AppColors.backgroundColorDark,
        title: const Text('Recover Password',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'RobotoSlab',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 70.0),
                const Text(
                  'Password Recovery',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'RobotoSlab',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Enter your email to recover your password',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'RobotoSlab',
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24.0),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 50.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {
                      recoverPassword();
                      //remove it when you you will send the mail to user for resend then only he or she will be able to reset the password and link will open this setnewpasword page
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SetNewPasswordPage()));
                    },
                    child: const Text(
                      'Recover Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RobotoSlab',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
