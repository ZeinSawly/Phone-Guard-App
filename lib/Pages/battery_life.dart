import 'package:flutter/material.dart';
import 'package:task2/Cards/battery_alarm_card.dart';

class BatteryLifePage extends StatefulWidget {
  const BatteryLifePage({super.key});

  @override
  State<BatteryLifePage> createState() => _BatteryLifePageState();
}

class _BatteryLifePageState extends State<BatteryLifePage> {
  bool fullAlarmEnabled = false;
  bool lowAlarmEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFE9EAFF),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              GestureDetector(
                onTap: () => Navigator.pop(context),
                child:  Text(
                  "< Back",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF202538),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
              SizedBox(height: 20),

              Text(
                "Battery",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF202538),
                ),
              ),
              
              SizedBox(height: 8),

              Text(
                "To expand your battery life, keep it between 20% and 80%",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF202538),
                ),
              ),
              
              SizedBox(height: 24),

              AlarmCard(
                title: "Battery full alarm",
                subtitle: "Set an alarm when battery\nreaches a certain percentage",
                initialValue: fullAlarmEnabled,
                onToggle: (val) => setState(() => fullAlarmEnabled = val),
              ),
              
              SizedBox(height: 16),

              AlarmCard(
                title: "Battery low alarm",
                subtitle: "Set an alarm when battery\nreaches a certain percentage",
                initialValue: lowAlarmEnabled,
                onToggle: (val) => setState(() => lowAlarmEnabled = val),
              ),
            ],
          ),
        ),
      ),
    );
  }
}