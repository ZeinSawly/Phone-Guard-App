import 'package:flutter/material.dart';

class BatteryStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final bool showArrow;
  final VoidCallback? onTap;

  const BatteryStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.showArrow = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 147,
      height: 140,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 4,
          ),
        ],
      ),

      child: Stack(
        children: [
          if (showArrow)
            Positioned(
              top: 5,
              right: 0,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 10,
                color: Colors.black,
              ),
            ),

          Positioned(
            bottom: 0,
            left: 0,
            child: Icon(
              icon,
              size: 22,
              color: Colors.black,
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              
              SizedBox(height: 8),
              
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    )
    );
  }
}