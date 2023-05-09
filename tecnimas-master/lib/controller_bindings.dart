import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:tecnimas/src/controllers/auth_controller.dart';
import 'package:tecnimas/src/controllers/services_controllert.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<ServicesController>(ServicesController());
  }
}
