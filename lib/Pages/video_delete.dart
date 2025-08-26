import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:task2/Pages/duplicate_videos.dart';
import 'dart:async';

class DeletingPage extends StatefulWidget {
  const DeletingPage({super.key});

  @override
  State<DeletingPage> createState() => _DeletingPageState();
}

class _DeletingPageState extends State<DeletingPage> {
  double progress = 0;
  bool isDone = false;

  @override
  void initState() {
    super.initState();
    simulateProgress();
  }

  void simulateProgress() {
    Timer.periodic(Duration(milliseconds: 50), (timer) { // Every 50ms increase progress by 1%
      setState(() {
        progress += 0.01;
        if (progress >= 1) { // Stops the timer when progress becomw 100%
          progress = 1;
          isDone = true;
          timer.cancel();

          Future.delayed(Duration(seconds: 2), () { // Wait 2s and go back to videos page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => DuplicateVideosPage()),
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
                    startAngle: 160,
                    endAngle: 20,
                    showTicks: false,
                    showLabels: false,
                    radiusFactor: 1,
                    
                    axisLineStyle: AxisLineStyle( // Draws the background arc in black
                      thickness: 0.15,
                      thicknessUnit: GaugeSizeUnit.factor,
                      color: Colors.black,
                      cornerStyle: CornerStyle.bothCurve,
                    ),
                    
                    pointers: <GaugePointer>[ // Fills the arc based on progress
                      RangePointer(
                        value: progress * 100,
                        width: 0.15,
                        sizeUnit: GaugeSizeUnit.factor,
                        color: Color(0xFF6A5AE0), 
                        cornerStyle: CornerStyle.bothCurve,
                      ),
                    ],
                    
                    annotations: <GaugeAnnotation>[ // Places a text label inside the gauge showing the current percentage
                      GaugeAnnotation(
                        widget: Text(
                          '$percent%',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF202538),
                          ),
                        ),
                        angle: 90,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            Text(
              isDone ? "1 File Deleted" : "Deleting File",
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