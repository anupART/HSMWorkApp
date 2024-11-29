import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Styles/Color/appTheme.dart';
import '../BottomNavBar/bottom_nav.dart';
import '../Drawer/navigation_drawer.dart';
import 'add_note_page.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List notes = [];
  bool isEditMode = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      setState(() {
        notes = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load notes');
    }
  }

  Future<void> deleteNote(int id) async {
    final response = await http
        .delete(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));

    if (response.statusCode == 200) {
      Navigator.pop(context); // Pop the bottom sheet
      fetchNotes(); // Refresh the notes list
    } else {
      throw Exception('Failed to delete note');
    }
  }

  Future<void> updateNote() async {
    final response = await http.put(
      Uri.parse(
          'https://jsonplaceholder.typicode.com/posts/${notes[selectedNoteIndex]['id']}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': _titleController.text,
        'body': _contentController.text,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Note updated')),
      );
      fetchNotes();
      setState(() {
        isEditMode = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update note')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerClass(),
      bottomNavigationBar: BottomNav(),
      appBar: AppBar(
        titleSpacing: 0,
        title: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Notes",
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
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4 / 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                ViewBottomSheet(context, index);
              },
              child: Card(
                elevation: 15.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notes[index]['title'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          notes[index]['body'],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        notes[index]['date'] ?? 'No date available',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        hoverElevation: 10,
        hoverColor: AppColors.buttonColor,
        backgroundColor: AppColors.unselectedButtonColor,
        onPressed: showAddNoteDialog,
        tooltip: 'Add Note',
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  int selectedNoteIndex = -1;

  void ViewBottomSheet(BuildContext context, int index) {
    selectedNoteIndex = index;
    _titleController.text = notes[index]['title'];
    _contentController.text = notes[index]['body'];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: AppColors.backgroundColorDark,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              height: MediaQuery.of(context).size.height / 2.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (!isEditMode)
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.lightGreen.shade300),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.edit_note_sharp,
                                  size: 25,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isEditMode = true;
                                  });
                                },
                              ),
                            ),
                          const SizedBox(width: 10),
                          if (!isEditMode)
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.shade200),
                              child: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () async {
                                  await deleteNote(notes[index]['id']);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Note deleted')),
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                      isEditMode
                          ? Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.lightGreen.shade300),
                              child: IconButton(
                                icon: const Icon(Icons.save),
                                onPressed: () {
                                  updateNote();
                                  Navigator.pop(context);
                                },
                              ),
                            )
                          : IconButton(
                              icon: const Icon(
                                Icons.cancel,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  isEditMode
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.backgroundColor,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Edit your note"),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.backgroundColor,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Notes"),
                          ),
                        ),
                  const SizedBox(height: 8),
                  isEditMode
                      ? TextField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(5)),
                          style: const TextStyle(fontSize: 22),
                        )
                      : Text(
                          notes[index]['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                  const SizedBox(height: 8),
                  if (!isEditMode)
                    Text(
                      notes[index]['date'] ?? 'No date available',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  const SizedBox(height: 8),
                  isEditMode
                      ? Expanded(
                          child: TextField(
                            controller: _contentController,
                            maxLines: null,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.all(8)),
                            style: const TextStyle(fontSize: 16),
                          ),
                        )
                      : Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              notes[index]['body'],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            );
          },
        );
      },
      isDismissible: false,
      isScrollControlled: true,
      enableDrag: false,
      sheetAnimationStyle: AnimationStyle(
          duration: Duration(milliseconds: 300),
          reverseDuration: Duration(milliseconds: 400),
        curve: Curves.bounceIn
      ),
    );
  }

  void showAddNoteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddNoteDialog(
          onAdd: fetchNotes,
        );
      },
    );
  }
}
