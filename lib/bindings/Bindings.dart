import 'package:get/get.dart';
import 'package:pas_project/controller/dashboardcontroller.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Dashboardcontroller() );

}
}