import 'package:flutter/material.dart';
import 'package:task2/Cards/app_card.dart';
import 'package:task2/Models/app_model.dart';

class AppManagerPage extends StatelessWidget {
  const AppManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EAFF),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(20),
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
                "Apps Manager",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF202538),
                ),
              ),
              
              SizedBox(height: 10),
              
              Text(
                "4 unused apps",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF202538),
                ),
              ),
              
              SizedBox(height: 24),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppCard(
                        app: App(
                          name: "Facebook",
                          image: "assets/facebook.jpg",
                        ),
                      ),
                      
                      SizedBox(height: 12),
                      
                      AppCard(
                        app: App(
                          name: "Tinder",
                          image: "assets/tinder.png",
                        ),
                      ),
                      
                      SizedBox(height: 12),
                      
                      AppCard(
                        app: App(
                          name: "Skype",
                          image: "assets/skype.png",
                        ),
                      ),
                      
                      SizedBox(height: 12),
                      
                      AppCard(
                        app: App(
                          name: "Tiktok",
                          image: "assets/tiktok.png",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}