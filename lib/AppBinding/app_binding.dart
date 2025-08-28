import 'package:get/get.dart';
import 'package:task2/controllers/compressing_controller.dart';
import 'package:task2/controllers/passcode_controller.dart';
import 'package:task2/controllers/speed_test_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PasscodeController(), permanent: true);
    Get.put(SpeedTestController(), permanent: true);
    Get.put(CompressingController(), permanent: true);
  }
}
