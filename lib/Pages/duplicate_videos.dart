import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2/Cards/video_boxcard.dart';
import 'package:task2/Pages/video_delete.dart';
import 'package:task2/Pages/videos.dart';

class DuplicateVideosPage extends StatefulWidget {
  const DuplicateVideosPage({super.key});

  @override
  State<DuplicateVideosPage> createState() => _DuplicateVideosPageState();
}

class _DuplicateVideosPageState extends State<DuplicateVideosPage> {
  bool firstCardSelected = false;

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
                    onTap: () => Get.to(() => VideosPage()),
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
                    "Duplicate Videos",
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF202538),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  Text(
                    firstCardSelected ? "1 selected, 35.3 mb" : "0 selected",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF202538),
                    ),
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
                      isSelected: [true, false, false, false],
                      onPressed: (int index) {},
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
                  
                  SizedBox(height: 20),
                  
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.6,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              firstCardSelected = !firstCardSelected;
                            });
                          },
                          child: VideoBoxCard(
                            thumbnailPath: 'assets/cam2.jpg',
                            sizeLabel: '12.4 mb',
                            isSelected: firstCardSelected,
                            showOriginal: true,
                          ),
                        ),
                        VideoBoxCard(thumbnailPath: 'assets/cam2.jpg', isSelected: false),
                        VideoBoxCard(thumbnailPath: 'assets/blr2.jpg', sizeLabel: '8.2 mb', isSelected: false, showOriginal: true),
                        VideoBoxCard(thumbnailPath: 'assets/blr2.jpg', isSelected: false),
                        VideoBoxCard(thumbnailPath: 'assets/wp2.jpg', sizeLabel: '6.7 mb', isSelected: false, showOriginal: true),
                        VideoBoxCard(thumbnailPath: 'assets/wp2.jpg', isSelected: false),
                        VideoBoxCard(thumbnailPath: 'assets/dup2.jpg', sizeLabel: '5.1 mb', isSelected: false, showOriginal: true),
                        VideoBoxCard(thumbnailPath: 'assets/dup2.jpg', isSelected: false),
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
                    if (firstCardSelected) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          contentPadding: EdgeInsets.all(24),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Delete 1 file permanently?",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF202538),
                                ),
                              ),
                              
                              SizedBox(height: 8),
                              
                              Text(
                                "This is permanent and cannot be undone",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              
                              SizedBox(height: 20),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("Cancel", style: TextStyle(color: Color(0xFF6A5AE0))),
                                  ),
                                 
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (_) => DeletingPage()),
                                      );
                                    },
                                    child: Text("Yes", style: TextStyle(color: Color(0xFF6A5AE0))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
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