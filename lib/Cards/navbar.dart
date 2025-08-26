import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2/Pages/battery.dart';
import 'package:task2/Pages/home.dart';
import 'package:task2/Pages/locker.dart';
import 'package:task2/Pages/settings.dart';
import 'navicon.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavBar({super.key, required this.selectedIndex});


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.white,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavIcon(
              icon: "assets/home.png",
              label: "Home",
              isActive: selectedIndex == 0,
              onTap: () => Get.to(() => const HomePage()),
            ),
            NavIcon(
              icon: "assets/battery.png",
              label: "Battery",
              isActive: selectedIndex == 1,
              onTap: () => Get.to(() => const BatteryPage()),
            ),
            SizedBox(width: 50,),
            NavIcon(
              icon: "assets/locker.png",
              label: "Locker",
              isActive: selectedIndex == 2,
              onTap: () => Get.to(() => LockerPage()),
            ),
            NavIcon(
              icon: "assets/settings.png",
              label: "Settings",
              isActive: selectedIndex == 3,
              onTap: () => Get.to(() => SettingsPage()),
            ),
          ],
        ),
      ),
    );
  }
}
