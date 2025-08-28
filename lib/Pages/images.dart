import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2/Components/image_grid.dart';
import 'package:task2/Pages/blurred_images.dart';
import 'package:task2/Pages/camera_images.dart';
import 'package:task2/Pages/duplicates_images.dart';
import 'package:task2/Pages/screenshot_images.dart';
import 'package:task2/Pages/whatsapp_images.dart';

class ImagesPage extends StatelessWidget {
  const ImagesPage({super.key});

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
                  "Images",
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
                      onTap: () => Get.to(() => CameraPage()),
                      child: ImageGrid(image1: "assets/cam1.jpg", image2: "assets/cam2.jpg", image3: "assets/cam3.jpg",image4: "assets/cam4.jpg", title: "Camera",),
                    ),
                    
                    SizedBox(width: 8),

                    GestureDetector(
                      onTap: () => Get.to(() => ScreenshotPage()),
                      child: ImageGrid(image1: "assets/scrs1.jpg", image2: "assets/scrs2.jpg", image3: "assets/scrs3.jpg",image4: "assets/scrs4.jpg", title: "Screenshots",),
                    )
                  
                  ]
                ),

                SizedBox(height: 16),

                Row(
                  children: [

                    GestureDetector(
                      onTap: () => Get.to(() => WhatsappPage()),
                      child: ImageGrid(image1: "assets/wp1.jpeg", image2: "assets/wp2.jpg", image3: "assets/wp3.jpg",image4: "assets/wp4.png", title: "Whatsapp",),
                    ),
                    
                    SizedBox(width: 8),

                    GestureDetector(
                      onTap: () => Get.to(() => DuplicatesPage()),
                      child: ImageGrid(image1: "assets/dup1.jpg", image2: "assets/dup2.jpg", image3: "assets/dup3.jpg",image4: "assets/dup4.jpg", title: "Duplicates",),
                    )
                  
                  ]
                ),

                SizedBox(height: 16),

                GestureDetector(
                  onTap: () => Get.to(() => BlurredPage()),
                  child: ImageGrid(image1: "assets/blr1.jpg", image2: "assets/blr2.jpg", image3: "assets/blr3.jpg",image4: "assets/blr4.jpg", title: "Blurred",)
                ),

              ]
        ),
       )
      )
    );
  }
}