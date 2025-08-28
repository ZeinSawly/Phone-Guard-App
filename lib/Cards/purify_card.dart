import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PurifyCard extends StatelessWidget {

  const PurifyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      padding:  EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient:  RadialGradient(
          colors: [Color(0xFFC6E6FF), Color(0xFF8D6FF5)],
          center: Alignment.topRight,
          radius: 1.5,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow:  [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  
                  Image.asset(
                    "assets/mekense.png",
                    width: 32,
                    height: 32,
                  ),
                  
                  SizedBox(height: 4),
                  
                  Text(
                    "Purify\nNow",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              
              SizedBox(width: 16),
              
              Padding(
                padding: EdgeInsets.only(top: 18),
                child: SizedBox(

                width: 80,
                height: 80,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      startAngle: 160, // Start at 160 degree
                      endAngle: 20, // End at 20 degree
                      showTicks: false, // Hide tick marks
                      showLabels: false, // Hide labels
                      radiusFactor: 1,
                      
                      axisLineStyle: AxisLineStyle( // The tracker
                        thickness: 0.15,
                        thicknessUnit: GaugeSizeUnit.factor,
                        color: Color.fromARGB(51, 255, 255, 255),
                        cornerStyle: CornerStyle.bothCurve,
                      ),
 
                      pointers: <GaugePointer>[ // The progress indicator
                        RangePointer(
                          value: 62,
                          width: 0.15,
                          sizeUnit: GaugeSizeUnit.factor,
                          color: Color.fromARGB(158, 255, 255, 255), 
                          cornerStyle: CornerStyle.bothCurve,
                        ),
                      ],

                      annotations: <GaugeAnnotation>[ // Put text in the middle of the gauge
                        GaugeAnnotation(
                          widget: Text(
                            '62%',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          angle: 90, // Place it at the bottom of the circle
                          positionFactor: 0.1,
                        ),
                      ],
                    ),
                  ],
                )
              ),
              ),
            ],
          ),
          
          SizedBox(height: 12),
          
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(51), // White with low opacitu (transparent)
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "157.48 GB of 254 GB",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}