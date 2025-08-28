import 'package:flutter/material.dart';

class PasscodeSetupPage extends StatefulWidget {
  const PasscodeSetupPage({super.key});

  @override
  State<PasscodeSetupPage> createState() => _PasscodeSetupPageState();
}

class _PasscodeSetupPageState extends State<PasscodeSetupPage> {
  List<String> passcode = []; // The digits the user is entering
  List<String> firstTry = []; // The first 4 digit number
  bool confirm = false; // False means we are in the first try

  void press(String num) {
    if (passcode.length < 4) passcode.add(num); // If number less than 4 digits, add it to te list

    if (passcode.length == 4) {
      if (!confirm) { // If first try
        firstTry = List.from(passcode); // Copy the 4 digits into first try
        passcode.clear(); // Empty the digits
        confirm = true; // To tell the user to confirm
      } else { // If confirm true
        if (passcode.join() == firstTry.join()) { // Compare the 2 numbers
          Navigator.pop(context); // If they match, close the page
        } else { // If no match
          passcode.clear(); // Clear passcode
          firstTry.clear(); // Clear first try
          confirm = false; // Let user start again
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
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: passcode.isNotEmpty ? Color.fromARGB(255, 215, 190, 251) : Colors.transparent,
                    border: Border.all(color: Color.fromARGB(255, 215, 190, 251)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: passcode.length > 1 ? Color.fromARGB(255, 215, 190, 251) : Colors.transparent,
                    border: Border.all(color: Color.fromARGB(255, 215, 190, 251)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: passcode.length > 2 ? Color.fromARGB(255, 215, 190, 251) : Colors.transparent,
                    border: Border.all(color: Color.fromARGB(255, 215, 190, 251)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: passcode.length > 3 ? Color.fromARGB(255, 215, 190, 251) : Colors.transparent,
                    border: Border.all(color: Color.fromARGB(255, 215, 190, 251)),
                  ),
                ),
              ],
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
