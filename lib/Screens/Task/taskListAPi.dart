// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:workapp/screen/Task/taskScreen.dart';
// import 'package:workapp/theme/appTheme.dart';
// import 'package:http/http.dart' as http;
//
// class TasklistClass extends StatefulWidget {
//   const TasklistClass({Key? key}) : super(key: key);
//
//   @override
//   State<TasklistClass> createState() => _TasklistClassState();
// }
//
// class _TasklistClassState extends State<TasklistClass> {
//   int curr = 0;
//   PageController _pageController = PageController();
//   List<Task> tasks = [];
//   List<String> items = [
//     "All",
//     "Completed",
//     "In Progress",
//     "In Review",
//     "On Hold",
//     "Testing",
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchTasks();
//   }
//
//   Future<void> _fetchTasks() async {
//     final response = await http.get(Uri.parse('https://your-api-endpoint/tasks'));
//
//     if (response.statusCode == 200) {
//       final List<dynamic> taskJson = json.decode(response.body);
//       setState(() {
//         tasks = taskJson.map((json) => Task.fromJson(json)).toList();
//       });
//     } else {
//       throw Exception('Failed to load tasks');
//     }
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Text(
//                 "Task List",
//                 style: TextStyle(
//                   fontFamily: 'RobotoSlab',
//                   fontSize: 22,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             SizedBox(
//               height: 60,
//               width: double.infinity,
//               child: ListView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 itemCount: items.length,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (ctx, index) {
//                   return Column(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             curr = index;
//                           });
//                           _pageController.jumpToPage(index);
//                         },
//                         child: AnimatedContainer(
//                           duration: const Duration(milliseconds: 200),
//                           margin: const EdgeInsets.all(5),
//                           width: 80,
//                           height: 40,
//                           decoration: BoxDecoration(
//                               color: curr == index
//                                   ? Colors.black
//                                   : AppColors.shadowLightColor,
//                               borderRadius: curr == index
//                                   ? BorderRadius.circular(22)
//                                   : BorderRadius.circular(17),
//                               border: curr == index
//                                   ? Border.all(color: Colors.black, width: 2)
//                                   : Border.all(color: Colors.black, width: 2)),
//                           child: Center(
//                             child: Text(
//                               items[index],
//                               style: TextStyle(
//                                   fontFamily: 'RobotoSlab',
//                                   fontSize: 12,
//                                   color: curr == index
//                                       ? Colors.white
//                                       : Colors.black),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Visibility(
//                           visible: curr == index,
//                           child: Container(
//                             width: 50,
//                             height: 5,
//                             decoration: BoxDecoration(
//                               color: Colors.black54,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ))
//                     ],
//                   );
//                 },
//               ),
//             ),
//             Expanded(
//               child: PageView(
//                 controller: _pageController,
//                 onPageChanged: (index) {
//                   setState(() {
//                     curr = index;
//                   });
//                 },
//                 children: [
//                   _buildTaskListView(),
//                   _buildFilteredTaskListView("Completed"),
//                   _buildFilteredTaskListView("To Do"),
//                   _buildFilteredTaskListView("In Progress"),
//                   _buildFilteredTaskListView("In Review"),
//                   _buildFilteredTaskListView("On Hold"),
//                   _buildFilteredTaskListView("Testing"),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTaskListView() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 12),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaY: 30, sigmaX: 30),
//               child: Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(
//                     color: Colors.white.withOpacity(0.1),
//                   ),
//                 ),
//                 child: _buildTaskListViewContent(tasks),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildFilteredTaskListView(String status) {
//     List<Task> filteredTasks =
//     tasks.where((task) => task.stage == status).toList();
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 10),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaY: 30, sigmaX: 30),
//               child: Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(
//                     color: Colors.white.withOpacity(0.1),
//                   ),
//                 ),
//                 child: _buildTaskListViewContent(filteredTasks),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTaskListViewContent(List<Task> tasks) {
//     return GridView.builder(
//       padding: const EdgeInsets.all(8.0),
//       shrinkWrap: true,
//       itemCount: tasks.length,
//       itemBuilder: (_, index) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TaskContainer(
//             task: tasks[index],
//           ),
//         );
//       },
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         childAspectRatio: 2.3,
//         crossAxisCount: 1,
//       ),
//     );
//   }
// }
//
// class TaskContainer extends StatelessWidget {
//   final Task task;
//
//   const TaskContainer({
//     Key? key,
//     required this.task,
//   }) : super(key: key);
//
//   Color _getPriorityColor(String priority) {
//     switch (priority) {
//       case 'High':
//         return Colors.red.withOpacity(0.7);
//       case 'Medium':
//         return Colors.orange.withOpacity(0.7);
//       case 'Low':
//         return Colors.green.withOpacity(0.7);
//       default:
//         return Colors.grey;
//     }
//   }
//
//   Color _getStageColor(String stage) {
//     switch (stage) {
//       case 'On Hold':
//         return Colors.deepPurpleAccent.withOpacity(0.5);
//       case 'Completed':
//         return Colors.blue.withOpacity(0.5);
//       case 'To Do':
//         return Colors.orange.withOpacity(0.5);
//       case 'In Progress':
//         return Colors.purple.withOpacity(0.5);
//       case 'In Review':
//         return Colors.yellow.withOpacity(0.5);
//       case 'Testing':
//         return Colors.pink.withOpacity(0.5);
//       default:
//         return Colors.grey;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => TaskScreen(task: task),
//           ),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.white,
//           border: Border.all(width: 2),
//         ),
//         padding: const EdgeInsets.all(10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     task.title,
//                     style: const TextStyle(
//                       fontFamily: 'RobotoSlab',
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 3),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ProjectScreen(
//                             projectName: task.projectName,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Text(
//                       task.projectName,
//                       style: const TextStyle(
//                         fontFamily: 'RobotoSlab',
//                         fontSize: 12,
//                         fontWeight: FontWeight.normal,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Priority',
//                         style: TextStyle(
//                           color: _getPriorityColor(task.priority),
//                           fontFamily: 'RobotoSlab',
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         'Stage',
//                         style: TextStyle(
//                           color: _getStageColor(task.stage),
//                           fontFamily: 'RobotoSlab',
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Task {
//   final String title;
//   final String projectName;
//   final String priority;
//   final String stage;
//
//   Task({
//     required this.title,
//     required this.projectName,
//     required this.priority,
//     required this.stage,
//   });
//
//   factory Task.fromJson(Map<String, dynamic> json) {
//     return Task(
//       title: json['title'],
//       projectName: json['projectName'],
//       priority: json['priority'],
//       stage: json['stage'],
//     );
//   }
// }
//
// class ProjectScreen extends StatelessWidget {
//   final String projectName;
//
//   const ProjectScreen({
//     Key? key,
//     required this.projectName,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(projectName),
//       ),
//       body: Center(
//         child: Text('Project details for $projectName'),
//       ),
//     );
//   }
// }
//
// class TaskScreen extends StatelessWidget {
//   final Task task;
//
//   const TaskScreen({
//     Key? key,
//     required this.task,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(task.title),
//       ),
//       body: Center(
//         child: Text('Task details for ${task.title}'),
//       ),
//     );
//   }
// }
// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:workapp/screen/Task/taskScreen.dart';
// import 'package:workapp/theme/appTheme.dart';
// import 'package:http/http.dart' as http;
//
// class TasklistClass extends StatefulWidget {
//   const TasklistClass({Key? key}) : super(key: key);
//
//   @override
//   State<TasklistClass> createState() => _TasklistClassState();
// }
//
// class _TasklistClassState extends State<TasklistClass> {
//   int curr = 0;
//   PageController _pageController = PageController();
//   List<Task> tasks = [];
//   List<String> items = [
//     "All",
//     "Completed",
//     "In Progress",
//     "In Review",
//     "On Hold",
//     "Testing",
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchTasks();
//   }
//
//   Future<void> _fetchTasks() async {
//     final response = await http.get(Uri.parse('https://your-api-endpoint/tasks'));
//
//     if (response.statusCode == 200) {
//       final List<dynamic> taskJson = json.decode(response.body);
//       setState(() {
//         tasks = taskJson.map((json) => Task.fromJson(json)).toList();
//       });
//     } else {
//       throw Exception('Failed to load tasks');
//     }
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Text(
//                 "Task List",
//                 style: TextStyle(
//                   fontFamily: 'RobotoSlab',
//                   fontSize: 22,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             SizedBox(
//               height: 60,
//               width: double.infinity,
//               child: ListView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 itemCount: items.length,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (ctx, index) {
//                   return Column(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             curr = index;
//                           });
//                           _pageController.jumpToPage(index);
//                         },
//                         child: AnimatedContainer(
//                           duration: const Duration(milliseconds: 200),
//                           margin: const EdgeInsets.all(5),
//                           width: 80,
//                           height: 40,
//                           decoration: BoxDecoration(
//                               color: curr == index
//                                   ? Colors.black
//                                   : AppColors.shadowLightColor,
//                               borderRadius: curr == index
//                                   ? BorderRadius.circular(22)
//                                   : BorderRadius.circular(17),
//                               border: curr == index
//                                   ? Border.all(color: Colors.black, width: 2)
//                                   : Border.all(color: Colors.black, width: 2)),
//                           child: Center(
//                             child: Text(
//                               items[index],
//                               style: TextStyle(
//                                   fontFamily: 'RobotoSlab',
//                                   fontSize: 12,
//                                   color: curr == index
//                                       ? Colors.white
//                                       : Colors.black),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Visibility(
//                           visible: curr == index,
//                           child: Container(
//                             width: 50,
//                             height: 5,
//                             decoration: BoxDecoration(
//                               color: Colors.black54,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ))
//                     ],
//                   );
//                 },
//               ),
//             ),
//             Expanded(
//               child: PageView(
//                 controller: _pageController,
//                 onPageChanged: (index) {
//                   setState(() {
//                     curr = index;
//                   });
//                 },
//                 children: [
//                   _buildTaskListView(),
//                   _buildFilteredTaskListView("Completed"),
//                   _buildFilteredTaskListView("To Do"),
//                   _buildFilteredTaskListView("In Progress"),
//                   _buildFilteredTaskListView("In Review"),
//                   _buildFilteredTaskListView("On Hold"),
//                   _buildFilteredTaskListView("Testing"),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTaskListView() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 12),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaY: 30, sigmaX: 30),
//               child: Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(
//                     color: Colors.white.withOpacity(0.1),
//                   ),
//                 ),
//                 child: _buildTaskListViewContent(tasks),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildFilteredTaskListView(String status) {
//     List<Task> filteredTasks =
//     tasks.where((task) => task.stage == status).toList();
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 10),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaY: 30, sigmaX: 30),
//               child: Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(
//                     color: Colors.white.withOpacity(0.1),
//                   ),
//                 ),
//                 child: _buildTaskListViewContent(filteredTasks),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTaskListViewContent(List<Task> tasks) {
//     return GridView.builder(
//       padding: const EdgeInsets.all(8.0),
//       shrinkWrap: true,
//       itemCount: tasks.length,
//       itemBuilder: (_, index) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TaskContainer(
//             task: tasks[index],
//           ),
//         );
//       },
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         childAspectRatio: 2.3,
//         crossAxisCount: 1,
//       ),
//     );
//   }
// }
//
// class TaskContainer extends StatelessWidget {
//   final Task task;
//
//   const TaskContainer({
//     Key? key,
//     required this.task,
//   }) : super(key: key);
//
//   Color _getPriorityColor(String priority) {
//     switch (priority) {
//       case 'High':
//         return Colors.red.withOpacity(0.7);
//       case 'Medium':
//         return Colors.orange.withOpacity(0.7);
//       case 'Low':
//         return Colors.green.withOpacity(0.7);
//       default:
//         return Colors.grey;
//     }
//   }
//
//   Color _getStageColor(String stage) {
//     switch (stage) {
//       case 'On Hold':
//         return Colors.deepPurpleAccent.withOpacity(0.5);
//       case 'Completed':
//         return Colors.blue.withOpacity(0.5);
//       case 'To Do':
//         return Colors.orange.withOpacity(0.5);
//       case 'In Progress':
//         return Colors.purple.withOpacity(0.5);
//       case 'In Review':
//         return Colors.yellow.withOpacity(0.5);
//       case 'Testing':
//         return Colors.pink.withOpacity(0.5);
//       default:
//         return Colors.grey;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => TaskScreen(task: task),
//           ),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.white,
//           border: Border.all(width: 2),
//         ),
//         padding: const EdgeInsets.all(10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     task.title,
//                     style: const TextStyle(
//                       fontFamily: 'RobotoSlab',
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 3),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ProjectScreen(
//                             projectName: task.projectName,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Text(
//                       task.projectName,
//                       style: const TextStyle(
//                         fontFamily: 'RobotoSlab',
//                         fontSize: 12,
//                         fontWeight: FontWeight.normal,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Priority',
//                         style: TextStyle(
//                           color: _getPriorityColor(task.priority),
//                           fontFamily: 'RobotoSlab',
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         'Stage',
//                         style: TextStyle(
//                           color: _getStageColor(task.stage),
//                           fontFamily: 'RobotoSlab',
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Task {
//   final String title;
//   final String projectName;
//   final String priority;
//   final String stage;
//
//   Task({
//     required this.title,
//     required this.projectName,
//     required this.priority,
//     required this.stage,
//   });
//
//   factory Task.fromJson(Map<String, dynamic> json) {
//     return Task(
//       title: json['title'],
//       projectName: json['projectName'],
//       priority: json['priority'],
//       stage: json['stage'],
//     );
//   }
// }
//
// class ProjectScreen extends StatelessWidget {
//   final String projectName;
//
//   const ProjectScreen({
//     Key? key,
//     required this.projectName,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(projectName),
//       ),
//       body: Center(
//         child: Text('Project details for $projectName'),
//       ),
//     );
//   }
// }
//
// class TaskScreen extends StatelessWidget {
//   final Task task;
//
//   const TaskScreen({
//     Key? key,
//     required this.task,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(task.title),
//       ),
//       body: Center(
//         child: Text('Task details for ${task.title}'),
//       ),
//     );
//   }
// }
