import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String baseIcon;     
  final String overlayIcon;  
  final VoidCallback? onTap;


  const InfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.baseIcon,
    required this.overlayIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      width: 160,
      height: 160,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF202538),
              letterSpacing: 0

            ),
          ),

          SizedBox(height: 12),
          // Stacked Icon
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  baseIcon,
                  width: 70,
                  height: 70,
                  fit: BoxFit.contain,
                ),
                Transform.translate(
                  offset: Offset(0, 5),
                  child: Image.asset(
                    overlayIcon,
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                ),

              ],
            ),
          ),

          Spacer(),
          // Subtitle + arrow
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF202538),
                  ),
                ),
              ),
              
              Icon(
                Icons.arrow_forward_ios,
                size: 10,
                color: Color(0xFF202538),
              ),
            ],
          ),
        ],
      ),
    )
    );
  }
}