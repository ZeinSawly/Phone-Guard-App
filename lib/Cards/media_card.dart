import 'package:flutter/material.dart';

class MediaCard extends StatefulWidget {
  final String icon;
  final String title;
  final VoidCallback? onTap;

  const MediaCard({
    super.key,
    required this.icon,
    required this.title,
    this.onTap
  });

    @override
  State<MediaCard> createState() => _MediaCardState();
}


class _MediaCardState extends State<MediaCard> {
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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

      child: Row(
        children: [
          Image.asset(widget.icon, width: 32, height: 32),
          
          SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202538),
                  ),
                ),
                
                SizedBox(height: 4),
                
                Text(
                  "129 mb",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF202538),
                  ),
                ),
              ],
            ),
          ),

          Icon(
            Icons.arrow_forward_ios,
            size: 12,
            color: Color(0xFF202538),
          ),
        ],
      ),
      ),
    );
  }
}