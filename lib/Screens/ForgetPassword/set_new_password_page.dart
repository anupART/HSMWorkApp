import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SetNewPasswordPage extends StatefulWidget {
  @override
  _SetNewPasswordPageState createState() => _SetNewPasswordPageState();
}

class _SetNewPasswordPageState extends State<SetNewPasswordPage> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> resetPassword() async {
    if (_formKey.currentState!.validate()) {
      final String newPassword = _newPasswordController.text;

      // Replace with your API endpoint
      final Uri apiUrl =
      Uri.parse('https://example.com/api/reset_password'); // Adjust this URL as needed

      final response = await http.post(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'password': newPassword,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password reset successfully')),
        );
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to reset password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff9381FF),
        title: Center(
            child: const Text('Reset Password',
                style: TextStyle(color: Colors.white))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Reset Your Password',
                    style: TextStyle(
                        fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Please enter your new password',
                    style: TextStyle(fontSize: 15.0, color: Colors.black54),
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    controller: _newPasswordController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'New Password',
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              color: Colors.black, width: 1)),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your new password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              color: Colors.black, width: 1)),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your new password';
                      }
                      if (value != _newPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff9381FF),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      onPressed: resetPassword,
                      child: const Text(
                        'Done',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
