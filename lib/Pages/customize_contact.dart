import 'package:flutter/material.dart';

class CustomizeContactPage extends StatefulWidget {
  final String contactName;

  const CustomizeContactPage({super.key, required this.contactName});

  @override
  State<CustomizeContactPage> createState() => _CustomizeContactPageState();
}

class _CustomizeContactPageState extends State<CustomizeContactPage> {
  bool isRounded = true;
  int selectedColorIndex = 0;

  final List<Color> colorOptions = [
    Color(0xFF6A5AE0), 
    Colors.white,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = colorOptions[selectedColorIndex];
    final Color textColor = selectedColor == Colors.white ? Color(0xFF6A5AE0) : Colors.white;

    return Scaffold(
      backgroundColor: Color(0xFFE9EAFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF202538),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Text(
                "Customize",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF202538),
                ),
              ),
              SizedBox(height: 20),

              Center(
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: selectedColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: isRounded
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: selectedColor == Colors.white
                                  ? Color(0x336A5AE0)
                                  : Color(0x4DFFFFFF),
                              child: Text(
                                widget.contactName[0],
                                style: TextStyle(fontSize: 24, color: textColor),
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              widget.contactName,
                              style: TextStyle(
                                fontSize: 16,
                                color: textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : Padding(
                          padding: EdgeInsets.only(left: 16, bottom: 16),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              widget.contactName,
                              style: TextStyle(
                                fontSize: 16,
                                color: textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                ),
              ),

              SizedBox(height: 20),

              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF9994E8),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ToggleButtons(
                    isSelected: [isRounded, !isRounded],
                    onPressed: (index) {
                      setState(() {
                        isRounded = index == 0;
                      });
                    },
                    renderBorder: false,
                    borderRadius: BorderRadius.circular(14),
                    fillColor: Color(0xFF6A5AE0),
                    selectedColor: Colors.white,
                    color: Colors.black,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        child: Text(
                          "Rounded",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        child: Text(
                          "Full Size",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: Text("Add Photo"),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                  },
                ),
              ),

              SizedBox(height: 12),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Icon Color Theme", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(colorOptions.length, (index) {
                        final color = colorOptions[index];
                        final isSelected = selectedColorIndex == index;

                        return GestureDetector(
                          onTap: () => setState(() => selectedColorIndex = index),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}