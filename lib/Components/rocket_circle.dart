import 'package:flutter/material.dart';

class GlowingCenterButton extends StatelessWidget {

  const GlowingCenterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      
      decoration: BoxDecoration( // To make it a circle with a gradient color
        shape: BoxShape.circle,
        gradient:  RadialGradient(
          colors: [Color(0xFFC6E6FF), Color(0xFF8D6FF5)],
          center: Alignment.topRight,
          radius: 1.3,
        ),
        
        boxShadow: [ // To add shadows to make it glow
          BoxShadow(
            color: Color(0x556C63FF),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Image.asset("assets/rocket.png"),
    );
  }
}
