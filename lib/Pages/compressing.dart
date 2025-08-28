import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:task2/controllers/compressing_controller.dart';
import 'video_compressor.dart';

class CompressingPage extends StatelessWidget {
  const CompressingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CompressingController>();

    controller.startCompression();

    return Scaffold(
      backgroundColor: Color(0xFFE9EAFF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF202538),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 80),

            Obx(() {
              final percent = (controller.progress.value * 100).toInt();

              if (controller.isDone.value) {
                Future.delayed(Duration(seconds: 2), () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => VideoCompressorPage()),
                  );
                });
              }

              return SizedBox(
                width: 180,
                height: 180,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: 100,
                      startAngle: 160,
                      endAngle: 20,
                      showTicks: false,
                      showLabels: false,
                      radiusFactor: 1,
                      
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.15,
                        thicknessUnit: GaugeSizeUnit.factor,
                        color: Colors.black,
                        cornerStyle: CornerStyle.bothCurve,
                      ),
                      
                      pointers: <GaugePointer>[
                        RangePointer(
                          value: controller.progress.value * 100,
                          width: 0.15,
                          sizeUnit: GaugeSizeUnit.factor,
                          color: Color(0xFF6A5AE0),
                          cornerStyle: CornerStyle.bothCurve,
                        ),
                      ],
                      
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Text(
                            "$percent%",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF202538),
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0.1,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),

            SizedBox(height: 40),

            Obx(() => Text(
                  controller.isDone.value
                      ? "File reduced from 200 mb to 44 mb"
                      : "Compressing File",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF202538),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}