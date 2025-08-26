import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2/Cards/media_card.dart';
import 'package:task2/Pages/home.dart';
import 'package:task2/Pages/images.dart';
import 'package:task2/Pages/videos.dart';

class SmartMediaPage extends StatelessWidget {
  const SmartMediaPage({super.key});

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
                onTap: () => Get.to(() => HomePage()),
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
                "Smart Media",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF202538),
                ),
              ),
              
              SizedBox(height: 24),

              MediaCard(
                icon: "assets/images.png",
                title: "Images",
                onTap: () => Get.to(() => ImagesPage()),
              ),
              
              SizedBox(height: 10),
              
              MediaCard(
                icon: "assets/videos.png",
                title: "Videos",
                onTap: () => Get.to(() => VideosPage())
              ),
            ],
          ),
        ),
      ),
    );
  }
}