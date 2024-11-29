// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:workapp/Screens/Project/projectDetails.dart';
// import 'package:workapp/Screens/Task/taskScreen.dart';
// import 'package:workapp/Screens/Task/task_controller.dart';
// import 'package:workapp/Screens/Task/task_model.dart';
// import '../../Styles/Color/appTheme.dart';
//
//
// class TasklistClass extends GetView<TaskController> {
//   TasklistClass({Key? key}) : super(key: key);
//   // int curr = 0;
//   final RxInt curr = 0.obs;
//   PageController _pageController = PageController();
//   List<Task> tasks = [
//     Task(
//       title: "Task name",
//       priority: "High",
//       stage: "On Hold",
//       date: "04 July 2024",
//       notes: "3",
//       projectName: 'Project name 1',
//       time: '14:34 PM',
//     ),
//     Task(
//       title: "Task 546",
//       priority: "High",
//       stage: "On Hold",
//       date: "04 July 2024",
//       notes: "3",
//       projectName: 'Project name 2',
//       time: '14:34 PM',
//     ),
//     // Task(
//     //   title: "Task 6",
//     //   priority: "Medium",
//     //   stage: "Testing",
//     //   date: "7 June 2024",
//     //   notes: "9",
//     //   projectName: 'Project name 3',
//     //   time: '14:34 PM',
//     // ),
//     // Task(
//     //   title: "Task 2",
//     //   priority: "Medium",
//     //   stage: "In Progress",
//     //   date: "05 July 2024",
//     //   notes: "2",
//     //   projectName: 'Project name 4',
//     //   time: '14:34 PM',
//     // ),
//     // Task(
//     //   title: "Task 3",
//     //   priority: "Low",
//     //   stage: "Completed",
//     //   date: "05 July 2024",
//     //   notes: "2",
//     //   projectName: 'Project name 5',
//     //   time: '14:34 PM',
//     // ),
//     // Task(
//     //   title: "Task 4",
//     //   priority: "High",
//     //   stage: "Testing",
//     //   date: "05 July 2024",
//     //   notes: "2",
//     //   projectName: 'Project name 6',
//     //   time: '14:34 PM',
//     // ),
//     // Task(
//     //   title: "Task 5",
//     //   priority: "Medium",
//     //   stage: "In Review",
//     //   date: "05 July 2024",
//     //   notes: "2",
//     //   projectName: 'Project name 7',
//     //   time: '14:34 PM',
//     // ),
//   ];
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
//   void dispose() {
//     _pageController.dispose();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:AppColors.backgroundColor,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Padding(
//               padding: EdgeInsets.all(15.0),
//               child: Text(
//                 "Task",
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
//               child: Obx(() {
//                 return ListView.builder(
//                   physics: const BouncingScrollPhysics(),
//                   itemCount: items.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (ctx, index) {
//                     return Column(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             curr.value = index;
//                             _pageController.jumpToPage(index);
//                           },
//                           child: AnimatedContainer(
//                             duration: const Duration(milliseconds: 200),
//                             margin: const EdgeInsets.all(5),
//                             width: 80,
//                             height: 40,
//                             decoration: BoxDecoration(
//                                 color: curr.value == index
//                                     ? AppColors.buttonColor
//                                     : AppColors.unselectedButtonColor,
//                                 borderRadius: curr.value == index
//                                     ? BorderRadius.circular(22)
//                                     : BorderRadius.circular(17),
//                                 border: curr.value == index
//                                     ? Border.all(color: Colors.white, width: 2)
//                                     : Border.all(
//                                     color: AppColors.backgroundColorDark,
//                                     width: 2)),
//                             child: Center(
//                               child: Text(
//                                 items[index],
//                                 style: TextStyle(
//                                     fontFamily: 'RobotoSlab',
//                                     fontSize: 12,
//                                     color: curr.value == index
//                                         ? Colors.white
//                                         : Colors.black),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Visibility(
//                             visible: curr == index,
//                             child: Container(
//                               width: 50,
//                               height: 5,
//                               decoration: BoxDecoration(
//                                 color: AppColors.buttonColor,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ))
//                       ],
//                     );
//                   },
//                 );
//               }
//               ),
//             ),
//             Expanded(
//               child: PageView(
//                 controller: _pageController,
//                 onPageChanged: (index) {
//
//                   curr.value = index;
//
//                 },
//                 children: [
//                   _buildTaskListView(),
//                   _buildFilteredTaskListView("Completed"),
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
//                 height: Get.size.height,
//                 width: Get.size.width,
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
//                 height: Get.size.height,
//                 width:Get.size.width,
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
//
// class TaskContainer extends GetView<TaskController> {
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
//           CupertinoPageRoute(
//             builder: (context) => TaskScreen(
//               task: task,
//             ),
//           ),
//
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(width: 2,color: AppColors.backgroundColorDark),
//           color: AppColors.backgroundColor,
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.shade500,
//               blurRadius: 5,
//               offset: const Offset(5,5),
//             ),
//             const BoxShadow(
//               color:AppColors.backgroundColor,
//               blurRadius: 5,
//               offset: Offset(-5,-5),
//             ),
//           ],
//           // color: Colors.white,
//
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
//                     controller.tasksCont[0].title.toString(),
//                     style: const TextStyle(
//                       fontFamily: 'RobotoSlab',
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 3),
//                   GestureDetector(
//                     onTap: (){
//                       Get.to(
//                           ProjectScreen(project:  task.projectName),
//                           transition: Transition.cupertino
//                       );
//                     },
//                     child: Text(
//                       task.projectName,
//                       style: const TextStyle(
//                         fontFamily: 'RobotoSlab',
//                         fontSize: 12,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(2),
//                         width: 80,
//                         decoration: BoxDecoration(
//                           color: _getPriorityColor(task.priority),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Center(child: Text(task.priority)),
//                       ),
//                       const SizedBox(width: 10),
//                       Container(
//                         padding: const EdgeInsets.all(2),
//                         width: 80,
//                         decoration: BoxDecoration(
//                           color: _getStageColor(task.stage),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Center(child: Text(task.stage)),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10), // Space before notes
//                   Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 NotesScreen(notes: task.notes),
//                           ),
//                         );
//                       },
//                       child: Row(
//                         children: [
//                           const Icon(
//                             Icons.notes_rounded,
//                             color: Colors.black87,
//                             size: 18,
//                           ),
//                           const SizedBox(width: 3),
//                           Text(
//                             task.notes,
//                             style: const TextStyle(
//                               fontFamily: 'RobotoSlab',
//                               fontSize: 11,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 const SizedBox(height: 25),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.calendar_month_outlined,
//                           color: Colors.black87,
//                           size: 18,
//                         ),
//                         const SizedBox(width: 3),
//                         Text(
//                           task.date,
//                           style: const TextStyle(
//                             fontFamily: 'RobotoSlab',
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.access_time,
//                           color: Colors.black87,
//                           size: 18,
//                         ),
//                         const SizedBox(width: 3),
//                         Text(
//                           task.time,
//                           style: const TextStyle(
//                             fontFamily: 'RobotoSlab',
//                             fontSize: 11,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class NotesScreen extends StatelessWidget {
//   final String notes;
//   const NotesScreen({Key? key, required this.notes}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(notes),
//       ),
//
//       body: Center(
//         child: Text("Details for $notes"),
//       ),
//     );
//   }
// }
//
//

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workapp/Screens/Project/projectDetails.dart';
import 'package:workapp/Screens/Task/taskScreen.dart';
import 'package:workapp/Screens/Task/task_controller.dart';
import 'package:workapp/Screens/Task/task_model.dart';
import '../../Styles/Color/appTheme.dart';

class TasklistClass extends StatefulWidget {
  TasklistClass({Key? key}) : super(key: key);

  @override
  _TasklistClassState createState() => _TasklistClassState();
}

class _TasklistClassState extends State<TasklistClass> {
  int curr = 0;
  PageController _pageController = PageController();
  List<Task> tasks = [
    Task(
      title: "Task name",
      priority: "High",
      stage: "On Hold",
      date: "04 July 2024",
      notes: "3",
      projectName: 'Project name 1',
      time: '14:34 PM',
    ),
    Task(
      title: "Task 546",
      priority: "High",
      stage: "On Hold",
      date: "04 July 2024",
      notes: "3",
      projectName: 'Project name 2',
      time: '14:34 PM',
    ),
    Task(
      title: "Task 6",
      priority: "Medium",
      stage: "Testing",
      date: "7 June 2024",
      notes: "9",
      projectName: 'Project name 3',
      time: '14:34 PM',
    ),
    Task(
      title: "Task 2",
      priority: "Medium",
      stage: "In Progress",
      date: "05 July 2024",
      notes: "2",
      projectName: 'Project name 4',
      time: '14:34 PM',
    ),
    Task(
      title: "Task 3",
      priority: "Low",
      stage: "Completed",
      date: "05 July 2024",
      notes: "2",
      projectName: 'Project name 5',
      time: '14:34 PM',
    ),
    Task(
      title: "Task 4",
      priority: "High",
      stage: "Testing",
      date: "05 July 2024",
      notes: "2",
      projectName: 'Project name 6',
      time: '14:34 PM',
    ),
  ];
  List<String> items = [
    "All",
    "Completed",
    "In Progress",
    "In Review",
    "On Hold",
    "Testing",
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Task",
                style: TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            curr = index;
                            _pageController.jumpToPage(index);
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.all(5),
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                            color: curr == index
                                ? AppColors.buttonColor
                                : AppColors.unselectedButtonColor,
                            borderRadius: curr == index
                                ? BorderRadius.circular(22)
                                : BorderRadius.circular(17),
                            border: curr == index
                                ? Border.all(color: Colors.white, width: 2)
                                : Border.all(
                                color: AppColors.backgroundColorDark,
                                width: 2),
                          ),
                          child: Center(
                            child: Text(
                              items[index],
                              style: TextStyle(
                                fontFamily: 'RobotoSlab',
                                fontSize: 12,
                                color:
                                curr == index ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: curr == index,
                        child: Container(
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    curr = index;
                  });
                },
                children: [
                  _buildTaskListView(),
                  _buildFilteredTaskListView("Completed"),
                  _buildFilteredTaskListView("In Progress"),
                  _buildFilteredTaskListView("In Review"),
                  _buildFilteredTaskListView("On Hold"),
                  _buildFilteredTaskListView("Testing"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskListView() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 30, sigmaX: 30),
              child: Container(
                height: Get.size.height,
                width: Get.size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
                child: _buildTaskListViewContent(tasks),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilteredTaskListView(String status) {
    List<Task> filteredTasks =
    tasks.where((task) => task.stage == status).toList();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 30, sigmaX: 30),
              child: Container(
                height: Get.size.height,
                width: Get.size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
                child: _buildTaskListViewContent(filteredTasks),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskListViewContent(List<Task> tasks) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      shrinkWrap: true,
      itemCount: tasks.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TaskContainer(
            task: tasks[index],
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2.3,
        crossAxisCount: 1,
      ),
    );
  }
}

class TaskContainer extends StatelessWidget {
  final Task task;

  const TaskContainer({
    Key? key,
    required this.task,
  }) : super(key: key);

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return Colors.red.withOpacity(0.7);
      case 'Medium':
        return Colors.orange.withOpacity(0.7);
      case 'Low':
        return Colors.green.withOpacity(0.7);
      default:
        return Colors.grey;
    }
  }

  Color _getStageColor(String stage) {
    switch (stage) {
      case 'On Hold':
        return Colors.deepPurpleAccent.withOpacity(0.5);
      case 'Completed':
        return Colors.blue.withOpacity(0.5);
      case 'To Do':
        return Colors.orange.withOpacity(0.5);
      case 'In Progress':
        return Colors.purple.withOpacity(0.5);
      case 'In Review':
        return Colors.yellow.withOpacity(0.5);
      case 'Testing':
        return Colors.pink.withOpacity(0.5);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => TaskScreen(
              task: task,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppColors.backgroundColorDark),
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 5,
              offset: const Offset(5, 5),
            ),
            const BoxShadow(
              color: AppColors.backgroundColor,
              blurRadius: 5,
              offset: Offset(-5, -5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: const TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        ProjectScreen(project: task.projectName),
                        transition: Transition.cupertino,
                      );
                    },
                    child: Text(
                      task.projectName,
                      style: const TextStyle(
                        fontFamily: 'RobotoSlab',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        width: 80,
                        decoration: BoxDecoration(
                          color: _getPriorityColor(task.priority),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text(task.priority)),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(2),
                        width: 80,
                        decoration: BoxDecoration(
                          color: _getStageColor(task.stage),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text(task.stage)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10), // Space before notes
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NotesScreen(notes: task.notes),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.notes_rounded,
                            color: Colors.black87,
                            size: 18,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            task.notes,
                            style: const TextStyle(
                              fontFamily: 'RobotoSlab',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.black87,
                          size: 18,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          task.date,
                          style: const TextStyle(
                            fontFamily: 'RobotoSlab',
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.black87,
                          size: 18,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          task.time,
                          style: const TextStyle(
                            fontFamily: 'RobotoSlab',
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotesScreen extends StatelessWidget {
  final String notes;

  const NotesScreen({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(notes),
      ),
      body: Center(
        child: Text("Details for $notes"),
      ),
    );
  }
}








