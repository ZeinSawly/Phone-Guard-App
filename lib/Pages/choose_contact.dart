import 'package:flutter/material.dart';
import 'package:task2/Pages/customize_contact.dart';

class ChooseContactPage extends StatelessWidget {
  const ChooseContactPage({super.key});

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
                  "Cancel",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF202538),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),

              Text(
                "Choose Contact",
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF202538),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Color(0xFF9994E8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.black),
                  ),
                ),
              ),

              SizedBox(height: 40),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CustomizeContactPage(contactName: "Amy"),
                    ),
                  );
                },
                child: Text(
                  "Amy", 
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF202538),
                      fontWeight: FontWeight.bold,
                  )
                ),
              ),

              
              SizedBox(height: 10),
              Divider(color: Colors.black12),
              SizedBox(height: 10),
              Text("Pauline", style: TextStyle(
                fontSize: 16,
                color: Color(0xFF202538),
                fontWeight: FontWeight.bold,
                )
              ),
              SizedBox(height: 10),
              Divider(color: Colors.black12),
              SizedBox(height: 10),
              Text("Name1", style: TextStyle(
                fontSize: 16,
                color: Color(0xFF202538),
                fontWeight: FontWeight.bold,
                )
              ),
              SizedBox(height: 10),
              Divider(color: Colors.black12),
              SizedBox(height: 10),
              Text("Name2", style: TextStyle(
                fontSize: 16,
                color: Color(0xFF202538),
                fontWeight: FontWeight.bold,
                )
              ),
              SizedBox(height: 10),
              Divider(color: Colors.black12),
              SizedBox(height: 10),
              Text("Name3", style: TextStyle(
                fontSize: 16,
                color: Color(0xFF202538),
                fontWeight: FontWeight.bold,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}