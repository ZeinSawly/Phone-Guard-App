import 'package:flutter/material.dart';

class SettingsOption extends StatelessWidget {
  final String title;

  const SettingsOption({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Divider(height: 1),
        
        ListTile(
          title: Text(
            title,
            style: TextStyle(
               fontSize: 14,
               color: Colors.black,
               fontWeight: FontWeight.bold,
               ),
          ),
          
          trailing: Icon(Icons.arrow_forward_ios, size: 12),

          onTap: () {},
        ),
      ],
    );
  }
}