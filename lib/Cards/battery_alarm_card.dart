import 'package:flutter/material.dart';

class AlarmCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool initialValue;
  final ValueChanged<bool>? onToggle;
  final VoidCallback? onTap;

  const AlarmCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.initialValue = false,
    this.onToggle,
    this.onTap,
  });

  @override
  State<AlarmCard> createState() => _AlarmCardState();
}

class _AlarmCardState extends State<AlarmCard> {
  bool isEnabled = false;
  double alarmValue = 80;

  @override
  void initState() {
    super.initState();
    isEnabled = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(20),
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

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202538),
                  ),
                ),

                Switch(
                  value: isEnabled,
                  onChanged: (val) {
                    setState(() => isEnabled = val);
                    widget.onToggle?.call(val);
                  },
                  activeColor: Color(0xFF9994E8),
                ),
              ],
            ),

            SizedBox(height: 8),

            if (!isEnabled)
              Text(
                widget.subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF202538),
                ),
              )

            else ...[
              Text(
                "You will get an alarm at 80%",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF202538),
                ),
              ),
              
              SizedBox(height: 8),
              
              Slider(
                value: alarmValue,
                min: 0,
                max: 100,
                divisions: 10,
                activeColor: Color(0xFF9994E8),
                onChanged: (val) {
                  setState(() => alarmValue = val);
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}