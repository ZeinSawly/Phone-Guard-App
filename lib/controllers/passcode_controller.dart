import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PasscodeController extends GetxController {
  var passcode = <String>[].obs; // The digits the user is entering
  var firstTry = <String>[].obs; // The first 4-digit number
  var confirm = false.obs; // False means we are in the first try

  // Called when a number is pressed
  void press(String num, BuildContext context) {
    if (passcode.length < 4) passcode.add(num);

    if (passcode.length == 4) {
      if (!confirm.value) { // First try
        firstTry.assignAll(passcode);
        passcode.clear();
        confirm.value = true;
      } else { // Confirm try
        if (passcode.join() == firstTry.join()) {
          Navigator.pop(context); // Correct passcode
        } else { // Wrong confirmation
          reset();
        }
      }
    }
  }

  void backspace() {
    if (passcode.isNotEmpty) passcode.removeLast();
  }

  void reset() {
    passcode.clear();
    firstTry.clear();
    confirm.value = false;
  }
}
