import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:task2/Pages/video_compressor.dart';
import 'dart:async';

class CompressingPage extends StatefulWidget {
  const CompressingPage({super.key});

  @override
  State<CompressingPage> createState() => _CompressingPageState();
}

class _CompressingPageState extends State<CompressingPage> {
  double progress = 0;
  bool isDone = false;

  @override
  void initState() {
    super.initState();
    simulateCompression();
  }

  void simulateCompression() {
    Timer.periodic(Duration(milliseconds: 50), (timer) { // Runs every 50ms to increase progress
      setState(() {
        progress += 0.01; // Adds 1% each tick
        if (progress >= 1) { // Finished compression
          progress = 1;
          isDone = true;
          timer.cancel(); // Stop the timer

          Future.delayed(Duration(seconds: 2), () { // Wait 2 seconds, then go back to VideoCompressorPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => VideoCompressorPage()),
            );
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).toInt();

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

            SizedBox(
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
                        value: progress * 100,
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
            ),

            SizedBox(height: 40),

            Text(
              isDone
                  ? "File reduced from 200 mb to 44 mb"
                  : "Compressing File",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF202538),
              ),
            ),
          ],
        ),
      ),
    );
  }
}