import 'package:flutter/material.dart';
import 'package:task2/Cards/battery_temp_card.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  String selectedUnit = "Celsius";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EAFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Text(
                  "< Back",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF202538),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
              SizedBox(height: 16),

              Text(
                "Temperature",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF202538),
                ),
              ),
              
              SizedBox(height: 24),

              TemperatureCard(
                label: "Celsius (°C)",
                isSelected: selectedUnit == "Celsius",
                onTap: () => setState(() => selectedUnit = "Celsius"),
              ),
              
              SizedBox(height: 16),
              
              TemperatureCard(
                label: "Fahrenheit (°F)",
                isSelected: selectedUnit == "Fahrenheit",
                onTap: () => setState(() => selectedUnit = "Fahrenheit"),
              ),
              
              SizedBox(height: 16),
              
              TemperatureCard(
                label: "Kelvin (°K)",
                isSelected: selectedUnit == "Kelvin",
                onTap: () => setState(() => selectedUnit = "Kelvin"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}