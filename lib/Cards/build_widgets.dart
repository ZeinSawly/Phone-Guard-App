import 'package:flutter/material.dart';
import 'package:task2/Pages/choose_contact.dart';

class WidgetCardContent extends StatelessWidget {
  final int selectedIndex;
  final int selectedColorIndex;
  final Function(int) onColorSelected;
  final List<Color> colorOptions;

  const WidgetCardContent({
    super.key,
    required this.selectedIndex,
    required this.selectedColorIndex,
    required this.onColorSelected,
    required this.colorOptions,
  });

  @override
  Widget build(BuildContext context) {
    final Color cardColor = colorOptions[selectedColorIndex]; // Get the color from the color option list
    final Color textColor = cardColor == Colors.white ? Color(0xFF6A5AE0) : Colors.white; // If card color is white, use text color as purple

    Widget content;

    switch (selectedIndex) {
      case 0: 
        content = Column(
          children: [
            Row(
              children: [
                Container(
                  width: 160,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Battery", style: TextStyle(color: textColor, fontSize: 14)),
                      SizedBox(height: 4),
                      Text("33%", style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.battery_3_bar, color: textColor, size: 32),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Battery", style: TextStyle(color: textColor, fontSize: 14)),
                  SizedBox(height: 4),
                  Text("33%", style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("Not Charging", style: TextStyle(color: textColor, fontSize: 12)),
                  Text("Low Power Mode Off", style: TextStyle(color: textColor, fontSize: 12)),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.battery_3_bar, color: textColor, size: 32),
                  ),
                ],
              ),
            ),
          ],
        );
        break;

      case 1:
        content = Column(
          children: [
            Row(
              children: [
                Container(
                  width: 160,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Storage", style: TextStyle(color: textColor, fontSize: 14)),
                      SizedBox(height: 4),
                      Text("33%", style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.storage, color: textColor, size: 32),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Storage", style: TextStyle(color: textColor, fontSize: 14)),
                  SizedBox(height: 4),
                  Text("33%", style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("42.24 of 128 GB", style: TextStyle(color: textColor, fontSize: 12)),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.storage, color: textColor, size: 32),
                  ),
                ],
              ),
            ),
          ],
        );
        break;

      case 2: 
        final Color fixedPurple = Color(0xFF6A5AE0);
        final Color fixedText = Colors.white;

        content = Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChooseContactPage()),
              );
            },
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: fixedPurple,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, size: 40, color: fixedText),
                  SizedBox(height: 8),
                  Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: fixedText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

      default:
        content = SizedBox();
    }

    return Column(
      children: [
        content,
        if (selectedIndex != 2) ...[
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(colorOptions.length, (index) {
                final color = colorOptions[index];
                final isSelected = selectedColorIndex == index;

                return GestureDetector(
                  onTap: () => onColorSelected(index),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                      border: Border.all(
                        color: Color(0xFF6A5AE0),
                        width: isSelected ? 3 : 1,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ],
    );
  }
}