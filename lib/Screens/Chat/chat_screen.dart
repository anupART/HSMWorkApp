import 'package:flutter/material.dart';
import '../../Styles/Color/appTheme.dart';

class ChatClass extends StatefulWidget {
  const ChatClass({super.key});

  @override
  State<ChatClass> createState() => _ChatClassState();
}

class _ChatClassState extends State<ChatClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text("Messaging"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        
          ],
        ),
      ),
    );
  }
}
