import 'package:flutter/material.dart';
import 'package:task2/Cards/contact_card.dart';
import 'package:task2/Models/contact_model.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

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
                "Contacts",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF202538),
                ),
              ),
              
              SizedBox(height: 10),
              
              Text(
                "Idle contacts",
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
                      ContactCard(
                        contact: Contact(
                          name: "Messi",
                          image: "assets/messi.jpg",
                        ),
                      ),
                      
                      SizedBox(height: 12),
                      
                      ContactCard(
                        contact: Contact(name: "Amy"),
                      ),
                      
                      SizedBox(height: 12),
                      
                      ContactCard(
                        contact: Contact(name: "Jawad"),
                      ),
                      
                      SizedBox(height: 12),
                      
                      ContactCard(
                        contact: Contact(name: "Rita"),
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