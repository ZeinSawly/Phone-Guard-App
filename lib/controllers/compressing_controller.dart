import 'package:get/get.dart';
import 'dart:async';

class CompressingController extends GetxController {

  var progress = 0.0.obs;  // Progress from 0.0 to 1.0
  var isDone = false.obs; // True when compression is done

  Timer? timer;

  // Start the compression simulation
  void startCompression() {
    progress.value = 0.0;
    isDone.value = false;

    timer?.cancel();

    timer = Timer.periodic(Duration(milliseconds: 50), (t) {
      progress.value += 0.01; // Add 1 each tick
      if (progress.value >= 1) {
        progress.value = 1;
        isDone.value = true;
        t.cancel();
      }
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
