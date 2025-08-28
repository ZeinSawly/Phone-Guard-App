import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2/Components/image_grid.dart';
import 'package:task2/Pages/duplicate_videos.dart';
import 'package:task2/Pages/large_videos.dart';
import 'package:task2/Pages/smart_media.dart';


class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

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
                  onTap: () => Get.to(() => SmartMediaPage()),
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
                  "Videos",
                  style:TextStyle(
                      fontSize: 22,
                      color: Color(0xFF202538),
                      fontWeight: FontWeight.bold,
                  )
                ),

                SizedBox(height: 16),

                Row(
                  children: [

                    GestureDetector(
                      onTap: () => Get.to(() => LargeVideosPage()),
                      child: ImageGrid(image1: "assets/cam1.jpg", image2: "assets/blr1.jpg", image3: "assets/wp1.jpeg",image4: "assets/dup1.jpg", title: "Large Videos",),
                    ),

                    SizedBox(width: 8),

                    GestureDetector(
                      onTap: () => Get.to(() => DuplicateVideosPage()),
                      child: ImageGrid(image1: "assets/cam2.jpg", image2: "assets/blr2.jpg", image3: "assets/wp2.jpg",image4: "assets/dup2.jpg", title: "Duplicates",),
                    )
                  ]
                ),
              ]
        ),
       )
      )
    );
  }
}