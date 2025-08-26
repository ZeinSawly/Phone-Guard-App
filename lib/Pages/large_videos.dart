import 'package:flutter/material.dart';
import 'package:task2/Cards/video_boxcard.dart';

class LargeVideosPage extends StatefulWidget {
  const LargeVideosPage({super.key});

  @override
  State<LargeVideosPage> createState() => _LargeVideosPageState();
}

class _LargeVideosPageState extends State<LargeVideosPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EAFF),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "< Back",
                      style: TextStyle(fontSize: 16, color: Color(0xFF202538), fontWeight: FontWeight.bold),
                    ),
                  ),
                  
                  SizedBox(height: 16),
                  
                  Text(
                    "Large Videos",
                    style: TextStyle(fontSize: 22, color: Color(0xFF202538), fontWeight: FontWeight.bold),
                  ),
                  
                  Text(
                    "1 selected, 35.3 mb",
                    style: TextStyle(fontSize: 12, color: Color(0xFF202538)),
                  ),
                  
                  SizedBox(height: 20),
                  
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF9994E8),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ToggleButtons(
                      renderBorder: false,
                      borderRadius: BorderRadius.circular(14),
                      fillColor: Color.fromARGB(255, 114, 109, 189),
                      selectedColor: Colors.white,
                      color: Colors.black,
                      isSelected: [
                        selectedIndex == 0,
                        selectedIndex == 1,
                        selectedIndex == 2,
                        selectedIndex == 3,
                      ],
                      onPressed: (int index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      children: [
                        for (final label in ["All", "Year", "Month", "Week"])
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text(
                              label,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.6,
                      children: [
                        VideoBoxCard(thumbnailPath: 'assets/cam1.jpg', sizeLabel: '35.3 mb', isSelected: false),
                        VideoBoxCard(thumbnailPath: 'assets/blr1.jpg', sizeLabel: '39.1 mb', isSelected: false),
                        VideoBoxCard(thumbnailPath: 'assets/wp1.jpeg', sizeLabel: '81.2 mb', isSelected: false),
                        VideoBoxCard(thumbnailPath: 'assets/dup1.jpg', sizeLabel: '44.7 mb', isSelected: false),
                      ],
                    ),
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8B6EF1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    elevation: 2,
                  ),
                  onPressed: () {
                  },
                  child: Text(
                    "Clean",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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