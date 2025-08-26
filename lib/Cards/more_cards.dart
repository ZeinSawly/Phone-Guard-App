import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2/Cards/more_card.dart';
import 'package:task2/Pages/speed_test.dart';
import 'package:task2/Pages/video_compressor.dart';
import 'package:task2/Pages/widgets.dart';

class MoreCards extends StatelessWidget {
  const MoreCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.to(() => WidgetsPage()),
          child: MoreCard(title: "Widgets", baseIcon: "assets/widget.png", overlayIcon: "assets/widgetTop.png",),
        ),

        GestureDetector(
          onTap: () => Get.to(() => SpeedTestPage()),
          child: MoreCard(title: "Speed", baseIcon: "assets/speed.png", overlayIcon: "assets/speedTop.png",),
        ),

        GestureDetector(
          onTap:  () => Get.to(() => VideoCompressorPage()),
          child: MoreCard(title: "Compressor", baseIcon: "assets/compressor.png", overlayIcon: "assets/compressorTop.png",),
        ),
      ],
    );
  }
}
