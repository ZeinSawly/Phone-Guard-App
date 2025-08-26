import 'package:flutter/material.dart';

class LockerCard extends StatefulWidget {
  final String title;
  final String icon;
  final String? subtitle;
  final bool showToggle;
  final bool showArrow;
  final Color backgroundColor;
  final VoidCallback? onToggle;

  const LockerCard({
    super.key,
    required this.title,
    required this.icon,
    this.subtitle,
    this.showToggle = false,
    this.showArrow = false,
    this.backgroundColor = Colors.white,
    this.onToggle,
  });

  @override
  State<LockerCard> createState() => _LockerCardState();
}

class _LockerCardState extends State<LockerCard> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
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
          Image.asset(widget.icon, width: 40, height: 40),
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
                if (widget.subtitle != null)
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      widget.subtitle!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF202538),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          if (widget.showArrow)
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Color(0xFF202538),
            ),

          if (widget.showToggle)
            Switch(
              value: isToggled,
              onChanged: (value) {
                setState(() {
                  isToggled = value;
                });
                if (widget.onToggle != null) {
                  widget.onToggle!();
                }
              },
              activeColor: Color(0xFF6A5AE0),
            ),
        ],
      ),
    );
  }
}
