import 'package:get/get.dart';
import 'dart:async';
import 'dart:math';

class SpeedTestController extends GetxController {
  
  var speed = 0.0.obs;  // Current speed value
  var download = 0.0.obs; // Download speed
  var upload = 0.0.obs; // Upload speed
  var ping = 0.obs; // Ping value
  var isTesting = false.obs; // To disable button while testing

  Timer? fluctuationTimer;

  /// Starts the speed test
  void startTest() {
    // Reset values and mark as running
    isTesting.value = true;
    speed.value = 0;
    download.value = 0;
    upload.value = 0;
    ping.value = 0;

    // Every 200ms, update speed with a random number between 0 and 10
    fluctuationTimer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      speed.value = double.parse((Random().nextDouble() * 10).toStringAsFixed(2));
    });

    // After 6 seconds, stop the timer and set final values
    Future.delayed(Duration(seconds: 6), () {
      fluctuationTimer?.cancel();
      speed.value = 5.98;
      download.value = 5.98;
      upload.value = 2.73;
      ping.value = 4;
      isTesting.value = false;
    });
  }

  @override
  void onClose() {
    fluctuationTimer?.cancel();
    super.onClose();
  }
}
