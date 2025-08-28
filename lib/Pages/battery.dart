import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2/Components/banner.dart';
import 'package:task2/Cards/battery_level_card.dart';
import 'package:task2/Cards/battery_stat_card.dart';
import 'package:task2/Components/navbar.dart';
import 'package:task2/Components/rocket_circle.dart';
import 'package:task2/Pages/battery_life.dart';
import 'package:task2/Pages/battery_temperature.dart';

class BatteryPage extends StatelessWidget {
  const BatteryPage({super.key});

  @override
  Widget build(BuildContext context) {    

    return Scaffold(

      floatingActionButton: GlowingCenterButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar:  CustomBottomNavBar(selectedIndex: 1),

      backgroundColor: Color(0xFFE9EAFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Battery",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
              SizedBox(height: 20),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      BatteryStatCard(
                        title: "Status",
                        value: "Discharging",
                        icon: Icons.battery_6_bar,
                      ),
                      
                      SizedBox(height: 16),
                      
                      BatteryStatCard(
                        title: "Battery Life",
                        value: "Good",
                        icon: Icons.favorite_border,
                        showArrow: true,
                        onTap: () => Get.to(() => BatteryLifePage()),
                      ),
                      
                      SizedBox(height: 16),
                      
                      BatteryStatCard(
                        title: "Temperature",
                        value: "29.4°C",
                        icon: Icons.device_thermostat,
                        showArrow: true,
                        onTap: () => Get.to(() => TemperaturePage()),
                      ),
                    ],
                  ),
                  
                  SizedBox(width: 28),

                  BatteryLevelCard(),
                ],
              ),

              SizedBox(height: 24),
              
              CustomBanner(imagePath: "assets/mask.png", title: "Time to power up!", subtitle: "click here to create your very own battery animation",),
            ],
            
          ),
        ),
      ),
    );
  }
}