import 'package:flutter/material.dart';

class PasscodeSetupPage extends StatefulWidget {
  const PasscodeSetupPage({super.key});

  @override
  State<PasscodeSetupPage> createState() => _PasscodeSetupPageState();
}

class _PasscodeSetupPageState extends State<PasscodeSetupPage> {
  List<String> passcode = [];
  List<String> firstTry = [];
  bool confirm = false;

  void press(String num) {
    if (passcode.length < 4) passcode.add(num);

    if (passcode.length == 4) {
      if (!confirm) {
        firstTry = List.from(passcode);
        passcode.clear();
        confirm = true;
      } else {
        if (passcode.join() == firstTry.join()) {
          Navigator.pop(context);
        } else {
          passcode.clear();
          firstTry.clear();
          confirm = false;
        }
      }
    }
    setState(() {});
  }

  void backspace() {
    if (passcode.isNotEmpty) passcode.removeLast();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
            Center(
              child: Text(
                confirm ? "Confirm Passcode" : "Create Passcode",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (i) {
                return Container(
                  margin: EdgeInsets.all(8),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i < passcode.length ? Color.fromARGB(255, 215, 190, 251): Colors.transparent,
                    border: Border.all(color: Color.fromARGB(255, 215, 190, 251)),
                  ),
                );
              }),
            ),
            SizedBox(height: 40),

            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: EdgeInsets.symmetric(horizontal: 40),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: List.generate(12, (i) {
                  if (i == 9) return SizedBox();
                  if (i == 11) {
                    return GestureDetector(
                      onTap: backspace,
                      child: Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                        child: Icon(Icons.backspace_outlined),
                      ),
                    );
                  }
                  final number = i == 10 ? "0" : "${i + 1}";
                  return GestureDetector(
                    onTap: () => press(number),
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      alignment: Alignment.center,
                      child: Text(number, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
