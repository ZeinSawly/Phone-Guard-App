import 'package:flutter/material.dart';

class BatteryLevelCard extends StatelessWidget {

  const BatteryLevelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 450,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow:  [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 4,
          ),
        ],
      ),

      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FractionallySizedBox( // A purple fill that takes up 42% of the card’s height
            heightFactor: 0.42,
            child: Container(
              decoration: BoxDecoration(
                color:  Color(0xFF8D6FF5),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
            ),
          ),

          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Column(
              children: [
                 Text(
                  "Battery Level",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF202538),
                  ),
                ),
                
                SizedBox(height: 8),
                
                Text(
                  "42%",
                  style:  TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202538),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}