import 'package:flutter/material.dart';
import 'package:task2/Models/app_model.dart';

class AppCard extends StatelessWidget {
  final App app;

  const AppCard({
    super.key,
    required this.app,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        
        Container(
          margin: EdgeInsets.symmetric(vertical: 6,  ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 4,
              ),
            ],
          ),

          child: Row(
            children: [
              ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        app.image!,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                        
              SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      app.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF202538),
                      ),
                    ),
                    
                    SizedBox(height: 4),
                    
                    Text(
                      "429 MB",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF202538),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Positioned(
          top: 0,
          right: -12,
          child:SizedBox(
              width: 80,
              height: 80,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/delete.png',
                    width: 55,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/deleteTop.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}