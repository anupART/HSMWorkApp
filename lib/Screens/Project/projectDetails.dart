import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workapp/Screens/Project/projectList.dart';
import '../../Styles/Color/appTheme.dart';

class ProjectScreen extends StatefulWidget {
  final String project;

  const ProjectScreen({Key? key, required this.project}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  int index = 0;
  bool isSelected = false;
  String department = "";
  String projectCategory = "";
  List<String> projectMembers = ["User1", "sw"];
  String? selectedUser;
  final TextEditingController _projectName =
      TextEditingController(text: "Project name");
  final TextEditingController _projectCategory =
      TextEditingController(text: "Project Category");
  final TextEditingController _projectDepartment =
      TextEditingController(text: "Project Department");
  final TextEditingController _projectDescription = TextEditingController(
      text: "Life is perspective therefore it is different from one another");
  final TextEditingController _startDate =
      TextEditingController(text: "20-07-2024");
  final TextEditingController _deadline =
      TextEditingController(text: "20-07-2024");
  final TextEditingController _totalTimeTaken =
      TextEditingController(text: "20-07-2024");
  final TextEditingController _projectLead =
      TextEditingController(text: "Project Lead");

  @override
  void dispose() {
    _projectName.dispose();
    _projectCategory.dispose();
    _projectDepartment.dispose();
    _projectDescription.dispose();
    _startDate.dispose();
    _deadline.dispose();
    _totalTimeTaken.dispose();
    _projectLead.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchDepartment();
  }

  Future<void> _fetchDepartment() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        titleSpacing: 4,
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          "Project Details",
          style: TextStyle(
            fontFamily: 'RobotoSlab',
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: AppColors.backgroundColor,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.backgroundColorDark,
                  ),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle("Project Name"),
                        _buildEditableTextField(
                            prefixIcon: Icons.task,
                            controller: TextEditingController(
                                text: widget.project.toString())),
                        _buildSectionTitle("Project Description"),
                        _buildEditableTextField(
                            prefixIcon: Icons.description,
                            controller: _projectDescription),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildSectionTitle("Start Date"),
                                  _buildEditableTextField(
                                      prefixIcon: Icons.calendar_today,
                                      controller: _startDate),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildSectionTitle("Deadline"),
                                  _buildEditableTextField(
                                      prefixIcon: Icons.scale,
                                      controller: _deadline),
                                ],
                              ),
                            ),
                          ],
                        ),
                        _buildSectionTitle("Department"),
                        _buildEditableTextField(
                            prefixIcon: Icons.emoji_objects_outlined,
                            controller: _projectDepartment),
                        _buildSectionTitle("Project Category"),
                        _buildEditableTextField(
                            prefixIcon: Icons.category,
                            controller: _projectCategory),
                        _buildSectionTitle("Project Lead"),
                        _buildEditableTextField(
                            prefixIcon: Icons.person, controller: _projectLead),
                        _buildSectionTitle("Project Members"),
                        _buildProjectMembersDropdown(),
                        _buildSectionTitle("Client"),
                        _buildProjectMembersDropdown(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 13.0, bottom: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoSlab',
          fontSize: 17,
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
        filled: true,
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

  Widget _buildProjectMembersDropdown() {
    if (projectMembers.length <= 1) {
      return Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            projectMembers.isNotEmpty ? projectMembers[0] : "No one Assigned",
            style: const TextStyle(
              fontFamily: 'RobotoSlab',
              fontSize: 14,
            ),
          ),
        ),
      );
    }

    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black),
      ),
      child: ListView.builder(
        itemCount: projectMembers.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 1.3,
            decoration: BoxDecoration(
              color: index % 2 == 0 ? Colors.white : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(15),
            child: Text(
              projectMembers[index],
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
