import 'package:flutter/material.dart';

class MoreCard extends StatelessWidget {
  final String title;
  final String baseIcon;
  final String overlayIcon;

  const MoreCard({super.key, required this.title, required this.baseIcon, required this.overlayIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 100,
      padding: EdgeInsets.all(12),
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

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  baseIcon,
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
                Transform.translate(
                  offset: Offset(0, 3),
                  child: Image.asset(
                    overlayIcon,
                    width: 25,
                    height: 25,
                    fit: BoxFit.contain,
                  ),
                ),

              ],
            ),
          ),
          
          SizedBox(height: 8),
          
          Text(title,
              style: TextStyle(
                  fontSize: 12, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  )
          ),
        ],
      ),
    );
  }
}
