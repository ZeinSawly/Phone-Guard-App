import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../Controllers/speed_test_controller.dart';
import '../Cards/speed_card.dart';

class SpeedTestPage extends StatelessWidget {
  const SpeedTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SpeedTestController>();

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

            SizedBox(height: 40),

            Obx(() {
              final speedText = controller.speed.value.toStringAsFixed(2);
              return SizedBox(
                width: 220,
                height: 180,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: 10,
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
                          value: controller.speed.value,
                          width: 0.15,
                          sizeUnit: GaugeSizeUnit.factor,
                          color: Color(0xFF6A5AE0),
                          cornerStyle: CornerStyle.bothCurve,
                        ),
                      ],
                      
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                speedText,
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF202538),
                                ),
                              ),
                              
                              SizedBox(height: 4),
                              
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.arrow_downward,
                                      size: 16, color: Color(0xFF6A5AE0)),
                                  
                                  SizedBox(width: 4),
                                  
                                  Text(
                                    "Mbps",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF202538),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Obx(() => Column(
                    children: [
                      SpeedCard(
                        label: "Download",
                        value: "${controller.download.value.toStringAsFixed(2)} Mbps",
                        icon: Icons.arrow_downward,
                        color: Color(0xFF6A5AE0),
                      ),
                      
                      SizedBox(height: 12),
                      
                      SpeedCard(
                        label: "Upload",
                        value: "${controller.upload.value.toStringAsFixed(2)} Mbps",
                        icon: Icons.arrow_upward,
                        color: Color(0xFF6A5AE0),
                      ),
                      
                      SizedBox(height: 12),
                      
                      SpeedCard(
                        label: "Ping",
                        value: "${controller.ping.value} ms",
                        icon: Icons.bolt,
                        color: Colors.redAccent,
                      ),
                    ],
                  )),
            ),

            Spacer(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Obx(() => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.isTesting.value
                          ? null
                          : controller.startTest,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8B6EF1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        "Start",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
