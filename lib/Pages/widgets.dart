import 'package:flutter/material.dart';
import 'package:task2/Cards/banner.dart';
import 'package:task2/Cards/build_widgets.dart';

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({super.key});

  @override
  State<WidgetsPage> createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  int selectedIndex = 0; // Track which tab is selected
  int selectedColorIndex = 0; // Track which color is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFE9EAFF),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding:  EdgeInsets.all(20),
              child: SingleChildScrollView(
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
                    SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          "Widgets",
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF202538),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         SizedBox(width: 12),
                         Expanded(
                          child: CustomBanner(
                            imagePath: "assets/wp1.jpeg",
                            title: "Press here to unlock a world of widgets for your phone",
                            size: "11",
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 20),

                    Container(
                      decoration: BoxDecoration(
                        color:  Color(0xFF9994E8),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ToggleButtons(
                        renderBorder: false, // Hide borders
                        borderRadius: BorderRadius.circular(14),
                        fillColor:  Color.fromARGB(255, 114, 109, 189), // Color of selected button
                        selectedColor: Colors.white,
                        color: Colors.black, // Text color of unselected buttons
                        isSelected: [ // Which tab is selected
                          selectedIndex == 0,
                          selectedIndex == 1,
                          selectedIndex == 2,
                        ],
                        onPressed: (int index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text("Battery",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text("Storage",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text("Contacts",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),

                     SizedBox(height: 20),

                    WidgetCardContent(
                      selectedIndex: selectedIndex,
                      selectedColorIndex: selectedColorIndex,
                      onColorSelected: (index) =>
                          setState(() => selectedColorIndex = index),
                      colorOptions:  [
                        Color(0xFF6A5AE0),
                        Colors.white,
                        Colors.black,
                      ],
                    ),

                     SizedBox(height: 100), 
                  ],
                ),
              ),
            ),

            if (selectedIndex != 2) // Only show the button for the first 2 tbs
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Color(0xFF6A5AE0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      elevation: 0,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) => Dialog(
                          backgroundColor: Colors.transparent,
                          child: Center(
                            child: Container(
                              padding:  EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding:  EdgeInsets.all(12),
                                    decoration:  BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFF6A5AE0),
                                    ),
                                    child:  Icon(Icons.check,
                                        size: 32, color: Colors.white),
                                  ),
                                   SizedBox(height: 12),
                                   Text(
                                    "Done",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF202538),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child:  Text(
                      "Set Color",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
