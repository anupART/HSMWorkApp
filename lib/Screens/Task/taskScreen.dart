import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workapp/Screens/Task/taskList.dart';
import 'package:workapp/Screens/Task/task_model.dart';

import '../../Styles/Color/appTheme.dart';


class TaskScreen extends StatefulWidget {
  final Task task;
  const TaskScreen({Key? key, required this.task}) : super(key: key);
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}
class _TaskScreenState extends State<TaskScreen> {
  int index = 0;
  bool isSelected = false;
  String priority = "";
  String stage = "";
  List<String> assignedTo = ["User1", "sw"];
  String? selectedUser;
  final TextEditingController _title =
      TextEditingController(text: "Title name");
  final TextEditingController _description = TextEditingController(
      text: "Life is perspective therefore it is different from one another");
  final TextEditingController _startTime =
      TextEditingController(text: "12:00 PM");
  final TextEditingController _endTime =
      TextEditingController(text: "15:00 PM");
  final TextEditingController _project =
      TextEditingController(text: "Project name");
  final TextEditingController _date = TextEditingController(text: "20-07-2024");
  final TextEditingController _totalTimeTaken =
      TextEditingController(text: "20-07-2024");
  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _startTime.dispose();
    _endTime.dispose();
    _project.dispose();
    _date.dispose();
    _totalTimeTaken.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    _fetchProirty();
    super.initState();
  }
  Future<void> _fetchProirty() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      priority = "Medium";
      stage = "Completed";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          "Task Details",
          style: TextStyle(
            fontFamily: 'RobotoSlab',
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 1.1,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Title",
                    style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  _buildEditableTextField(
                      prefixIcon: Icons.task, controller: _title),
                  const SizedBox(
                    height: 13,
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  _buildEditableTextField(
                      prefixIcon: Icons.description, controller: _description),
                  const SizedBox(
                    height: 13,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Start Time",
                          style: TextStyle(
                            fontFamily: 'RobotoSlab',
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "End Time",
                          style: TextStyle(
                            fontFamily: 'RobotoSlab',
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _buildEditableTextField(
                            prefixIcon: Icons.play_arrow,
                            controller: _startTime),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: _buildEditableTextField(
                            prefixIcon: Icons.timer_off_outlined,
                            controller: _totalTimeTaken),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Text(
                    "Priority",
                    style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontSize: 17,
                    ),
                  ),
                  _buildProrityContainer(),
                  const SizedBox(
                    height: 13,
                  ),
                  const Text(
                    "Status",
                    style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontSize: 17,
                    ),
                  ),
                  _buildStageContainer(),
                  const SizedBox(
                    height: 13,
                  ),
                  const Text(
                    "Project",
                    style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontSize: 17,
                    ),
                  ),
                  _buildEditableTextField(
                      prefixIcon: Icons.policy, controller: _project),
                  const SizedBox(
                    height: 13,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(
                            fontFamily: 'RobotoSlab',
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "Total Time",
                          style: TextStyle(
                            fontFamily: 'RobotoSlab',
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _buildEditableTextField(
                            prefixIcon: Icons.calendar_today,
                            controller: _date),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: _buildEditableTextField(
                            prefixIcon: Icons.access_time_outlined,
                            controller: _totalTimeTaken),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Text(
                    "Assigned To",
                    style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  _buildAssignedToDropdown(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEditableTextField({
    required IconData prefixIcon,
    required TextEditingController controller,
  }) {
    return TextFormField(
      minLines: 1,
      maxLines: 10,
      readOnly: true,
      style: const TextStyle(
        fontFamily: 'RobotoSlab',
        fontSize: 14,
      ),
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        prefixIcon: Icon(
          prefixIcon,
          size: 22,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget _buildProrityContainer() {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black),
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      width: 430,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildProrityContainerColor("High"),
          _buildProrityContainerColor("Medium"),
          _buildProrityContainerColor("Low")
        ],
      ),
    );
  }

  Widget _buildProrityContainerColor(String level) {
    Color color;
    if (priority == level) {
      if (level == 'High') {
        color = Colors.redAccent.withOpacity(0.7);
      } else if (level == 'Medium') {
        color = Colors.orangeAccent.withOpacity(0.7);
      } else {
        color = Colors.greenAccent.withOpacity(0.7);
      }
    } else {
      color = Colors.white;
    }
    return Container(
      padding: const EdgeInsets.all(2),
      width: MediaQuery.of(context).size.width / 4,
      height: 45,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          border: Border.all()),
      child: Center(
          child: Text(
        level,
        style: TextStyle(
          color: priority == level ? Colors.white : Colors.black,
          fontFamily: 'RobotoSlab',
          fontSize: 14,
        ),
      )),
    );
  }

  Widget _buildStageContainer() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        width: 430,
        height: 50,
        child: Center(
          child: _buildStageContainerColor(stage),
        ));
  }

  Widget _buildStageContainerColor(String level) {
    Color color = getStatusColor(level);
    return Container(
      padding: const EdgeInsets.all(2),
      width: 430,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: color,
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Text(
          level,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Color getStatusColor(String stage) {
    switch (stage.toLowerCase()) {
      case 'on hold':
        return Colors.purpleAccent.withOpacity(0.5);
      case 'progress':
        return Colors.orange.withOpacity(0.5);
      case 'completed':
        return Colors.green.withOpacity(0.5);
      case 'to do':
        return Colors.blueAccent.withOpacity(0.5);
      case 'in review':
        return Colors.brown.withOpacity(0.5);
      case 'testing':
        return Colors.deepPurple.withOpacity(0.5);
      default:
        return Colors.grey.withOpacity(0.5);
    }
  }


  Widget _buildAssignedToDropdown() {
    if (assignedTo.length <= 1) {
      return Container(
        height: 50, // Fixed height
        width: MediaQuery.of(context).size.width / 1.1, // Fixed width
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            assignedTo.isNotEmpty ? assignedTo[0] : "No one Assigned",
            style: const TextStyle(
              fontFamily: 'RobotoSlab',
              fontSize: 14,
            ),
          ),
        ),
      );
    }

    return Container(
      height: 150, // Fixed height
      width: MediaQuery.of(context).size.width / 1.1, // Fixed width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black),
      ),
      child: ListView.builder(
        itemCount: assignedTo.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            // Fixed height
            width: MediaQuery.of(context).size.width / 1.3,
            decoration: BoxDecoration(
              color: index % 2 == 0 ? Colors.white : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),

            padding: const EdgeInsets.all(15),
            child: Text(
              assignedTo[index],
              style: const TextStyle(
                fontFamily: 'RobotoSlab',
                fontSize: 14,
              ),
            ),
          );
        },
      ),
    );
  }
}
