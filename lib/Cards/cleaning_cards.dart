
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2/Cards/info_card.dart';
import 'package:task2/Cards/purify_card.dart';
import 'package:task2/Pages/app_manager.dart';
import 'package:task2/Pages/contacts.dart';
import 'package:task2/Pages/smart_media.dart';

class CleaningCards extends StatelessWidget {
  const CleaningCards({super.key});

  @override
  Widget build(BuildContext context) {
  
  return Transform.translate(
  offset:  Offset(0, -50), // Moves up by 50 pixels
  
  child: GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children:  [
        InfoCard(
          title: "Smart Media",
          subtitle: "2743 files",
          baseIcon: "assets/media.png",
          overlayIcon: "assets/mediaTop.png",
          onTap: () => Get.to(() => SmartMediaPage())
        ),
        
        PurifyCard(progress: 0.62),
        
        InfoCard(
          title: "Apps Manager",
          subtitle: "4 unused apps",
          baseIcon: "assets/apps.png",
          overlayIcon: "assets/appsTop.png",
          onTap: () => Get.to(() => AppManagerPage())
        ),
        
        InfoCard(
          title: "Contacts",
          subtitle: "374 files",
          baseIcon: "assets/contacts.png",
          overlayIcon: "assets/contactsTop.png",
          onTap: () => Get.to(() => ContactsPage())
        ),
      ],
    )
    );
  }
}