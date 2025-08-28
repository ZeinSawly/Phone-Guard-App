import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:async';
import 'dart:math';

import 'package:task2/Cards/speed_card.dart';

class SpeedTestPage extends StatefulWidget {
  const SpeedTestPage({super.key});

  @override
  State<SpeedTestPage> createState() => _SpeedTestPageState();
}

class _SpeedTestPageState extends State<SpeedTestPage> {
  double speed = 0.0;
  double download = 0.0;
  double upload = 0.0;
  int ping = 0;
  bool isTesting = false; // To disable button while testing

  Timer? fluctuationTimer; // Simulates changing speed during the test

  void startTest() {
    setState(() { // Reset values and mark as running
      isTesting = true;
      speed = 0;
      download = 0;
      upload = 0;
      ping = 0;
    });

    fluctuationTimer = Timer.periodic(Duration(milliseconds: 200), (timer) { // Every 200ms, update speed with a random number between 0 and 10
      setState(() {
        speed = double.parse((Random().nextDouble() * 10).toStringAsFixed(2));
      });
    });


    Future.delayed(Duration(seconds: 6), () { // After 6 seconds, stop the timer and set final values
      fluctuationTimer?.cancel();
      setState(() {
        speed = 5.98;
        download = 5.98;
        upload = 2.73;
        ping = 4;
        isTesting = false;
      });
    });
  }

  @override
  void dispose() {
    fluctuationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final speedText = speed.toStringAsFixed(2); // CHange to a string to add to the gauge

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

            SizedBox(
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
                        value: speed,
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
                                Icon(Icons.arrow_downward, size: 16, color: Color(0xFF6A5AE0)),
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
            ),

            SizedBox(height: 40),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SpeedCard(
                    label: "Download",
                    value: "${download.toStringAsFixed(2)} Mbps",
                    icon: Icons.arrow_downward,
                    color: Color(0xFF6A5AE0),
                  ),
                  SizedBox(height: 12),
                  SpeedCard(
                    label: "Upload",
                    value: "${upload.toStringAsFixed(2)} Mbps",
                    icon: Icons.arrow_upward,
                    color: Color(0xFF6A5AE0),
                  ),
                  SizedBox(height: 12),
                  SpeedCard(
                    label: "Ping",
                    value: "$ping ms",
                    icon: Icons.bolt,
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ),

            Spacer(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isTesting ? null : startTest,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
