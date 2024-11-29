import 'package:get/get.dart';
import 'package:workapp/Screens/Task/task_controller.dart';

class AllBindings extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    
    Get.lazyPut(()=>TaskController());
  }

}