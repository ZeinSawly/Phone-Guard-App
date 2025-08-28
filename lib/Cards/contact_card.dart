import 'package:flutter/material.dart';
import 'package:task2/Models/contact_model.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;

  const ContactCard({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allow parts to overflow outside of the card
      children: [
        Container(
          
          margin: EdgeInsets.symmetric(vertical: 6,),
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
              contact.image != null // If contact has an image
                      ? ClipRRect( // Use it with circular shape
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        contact.image!,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    )

                  : CircleAvatar( // If no image, use a circle avatar with the contact's first letter name
                      radius: 20,
                      backgroundColor:  Color(0xFF8D74F0),
                      child: Text(
                        contact.name[0],
                        style:  TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              
              SizedBox(width: 12),

              Expanded(
                child: Text(
                  contact.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202538),
                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned( // Positioned is used inside a stack to place a child
          top: 0, // Places the delete icon top right corner of the stack
          right: -12,
          child: SizedBox(
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