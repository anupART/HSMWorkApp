import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../Styles/Color/appTheme.dart';


class AddNoteDialog extends StatefulWidget {
  final Function onAdd;

  AddNoteDialog({required this.onAdd});

  @override
  _AddNoteDialogState createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends State<AddNoteDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  String? date;

  void currentdate() {
    DateTime now = DateTime.now();
    String formattedData = DateFormat('dd MMM, yyyy  HH:mm:ss').format(now);
    date = formattedData;
  }

  @override
  void initState() {
    super.initState();
    currentdate();
  }

  Future<void> addNote() async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': _titleController.text,
        'body': _contentController.text,
      }),
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Note added')),
      );
      widget.onAdd();
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to add note')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      backgroundColor: AppColors.backgroundColorDark,
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.backgroundColor),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Add Note",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )),
            const SizedBox(height: 16),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: "Add Title",
                border: OutlineInputBorder(),
                fillColor: Colors.white,
              ),
              style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _contentController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "Add note details",
                border: OutlineInputBorder(),
                fillColor: Colors.white,
              ),
              style: const TextStyle(fontSize: 18),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                date!,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        ElevatedButton(
          style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color> (AppColors.unselectedButtonColor)),
          onPressed: addNote,
          child: const Text('Add',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
