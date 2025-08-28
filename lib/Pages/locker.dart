import 'package:flutter/material.dart';
import 'package:task2/Cards/locker_card.dart';
import 'package:task2/Cards/navbar.dart';
import 'package:task2/Cards/rocket_circle.dart';
import 'package:task2/Pages/passcode_setup.dart';

class LockerPage extends StatelessWidget {
  const LockerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EAFF),
      floatingActionButton: GlowingCenterButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 2),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 100),
              Image.asset("assets/lockerPage.png", width: 120),
              SizedBox(height: 16),
              Text(
                "Locker",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF202538),
                ),
              ),
              SizedBox(height: 40),

              LockerCard(
                title: "Passcode",
                icon: "assets/passcode.png",
                showToggle: true,
                onToggle: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PasscodeSetupPage(),
                    ),
                  );
                },
              ),

              SizedBox(height: 16),

              LockerCard(
                title: "App Locker",
                icon: "assets/appLocker.png",
                showArrow: true,
              ),

              SizedBox(height: 16),

              LockerCard(
                title: "Remote App Locker",
                icon: "assets/remoteLocker.png",
                subtitle: "Lock your apps remotely through the web",
                showToggle: true,
                onToggle: () {
                 null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
