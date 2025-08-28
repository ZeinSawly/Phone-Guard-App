import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/passcode_controller.dart';

class PasscodeSetupPage extends StatelessWidget {
  const PasscodeSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PasscodeController>();

    controller.reset();

    return Scaffold(
      backgroundColor: Color(0xFFE9EAFF),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "< Back",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Center(child: Image.asset("assets/passcode.png", width: 100)),
            SizedBox(height: 20),

            Obx(() => Center(
                  child: Text(
                    controller.confirm.value
                        ? "Confirm Passcode"
                        : "Create Passcode",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )),

            SizedBox(height: 20),

            // Passcode dots
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index < controller.passcode.length
                            ? Color.fromARGB(255, 179, 149, 221)
                            : Colors.transparent,
                        border: Border.all(
                          color: Color.fromARGB(255, 179, 149, 221),
                        ),
                      ),
                    );
                  }),
                )),

            SizedBox(height: 40),

            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: EdgeInsets.symmetric(horizontal: 40),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: List.generate(12, (i) {
                  if (i == 9) return SizedBox(); // Empty cell
                  if (i == 11) {
                    return GestureDetector(
                      onTap: controller.backspace,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(Icons.backspace_outlined),
                      ),
                    );
                  }
                  final number = i == 10 ? "0" : "${i + 1}";
                  return GestureDetector(
                    onTap: () => controller.press(number, context),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        number,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
