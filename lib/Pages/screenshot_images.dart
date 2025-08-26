import 'package:flutter/material.dart';
import 'package:task2/Cards/images_boxcard.dart';

class ScreenshotPage extends StatefulWidget {
  const ScreenshotPage({super.key});

  @override
  State<ScreenshotPage> createState() => _ScreenshotPageState();
}

class _ScreenshotPageState extends State<ScreenshotPage> {
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
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF202538),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 16),
                  
                  Text(
                    "Screenshots",
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF202538),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  Text(
                    "63 selected, 1.7 gb",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF202538),
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  
                  Row(
                    children: [
                      
                      SizedBox(width: 5),
                      
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
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 20),
                  
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.9,
                      children: [
                        ImageBoxCard(imagePath: 'assets/scrs1.jpg', sizeLabel: '2.13 mb', isSelected: true, showOriginal: true),
                        ImageBoxCard(imagePath: 'assets/scrs1.jpg', isSelected: false, showOriginal: false),
                        ImageBoxCard(imagePath: 'assets/scrs2.jpg', sizeLabel: '2.13 mb', isSelected: true, showOriginal: true),
                        ImageBoxCard(imagePath: 'assets/scrs2.jpg', isSelected: false, showOriginal: false),
                        ImageBoxCard(imagePath: 'assets/scrs3.jpg', sizeLabel: '2.13 mb', isSelected: true, showOriginal: true),
                        ImageBoxCard(imagePath: 'assets/scrs3.jpg', isSelected: false, showOriginal: false),
                        ImageBoxCard(imagePath: 'assets/scrs4.jpg', sizeLabel: '2.13 mb', isSelected: true, showOriginal: true),
                        ImageBoxCard(imagePath: 'assets/scrs4.jpg', isSelected: false, showOriginal: false),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    elevation: 2,
                  ),
                  onPressed: () {
                    null;
                  },
                  child: Text(
                    "Clean",
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