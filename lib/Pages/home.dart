import 'package:flutter/material.dart';
import 'package:task2/Cards/cleaning_cards.dart';
import 'package:task2/Cards/more_cards.dart';
import 'package:task2/Cards/navbar.dart';
import 'package:task2/Cards/rocket_circle.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EAFF),

      floatingActionButton: GlowingCenterButton(icon: "assets/rocket.png"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar:  CustomBottomNavBar(selectedIndex: 0),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),

            Text(
              "Cleaning",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),

            CleaningCards(),

            Text(
              "More",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),

            MoreCards(),
          ],
        ),
      ),
    );
  }
}
