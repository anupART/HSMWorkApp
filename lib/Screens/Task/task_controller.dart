import 'package:get/get.dart';
import 'package:workapp/Screens/Task/task_model.dart';

class TaskController extends GetxController {

  var tasksCont = <Task>[].obs;
  var curr=0.obs;
  changePageTo(int index) {
    curr.value = index;
  }
  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void loadTasks() {
    // Add mock data or fetch from an API here it is thal
    tasksCont.addAll([
      Task(
        title: "Task 1",
        priority: "High",
        stage: "On Hold",
        date: "04 July 2024",
        notes: "3",
        projectName: 'Project 1',
        time: '14:34 PM',
      ),
      Task(
        title: "Task 1",
        priority: "High",
        stage: "On Hold",
        date: "04 July 2024",
        notes: "3",
        projectName: 'Project 1',
        time: '14:34 PM',
      ),
      // Add more tasks
    ]);
  }

}
