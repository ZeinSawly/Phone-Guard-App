import 'package:flutter/material.dart';
import 'package:task2/Components/banner.dart';
import 'package:task2/Components/navbar.dart';
import 'package:task2/Components/rocket_circle.dart';
import 'package:task2/Cards/settings_option_card.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFE9EAFF),

      floatingActionButton:  GlowingCenterButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar:  CustomBottomNavBar(selectedIndex: 3),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF202538),
                ),
              ),
              
              SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding:  EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                
                child:  Center(
                  child: Text(
                    "Sign in with Apple",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24),

              Text(
                "Find out more:",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 12),

              CustomBanner(
                imagePath: "assets/mask.png",
                title: "Get Charging Animation App",
              ),

              SizedBox(height: 12),

              CustomBanner(
                imagePath: "assets/settingsWidget.png",
                title: "Get Lock Screen Widget App",
              ),

              SizedBox(height: 16),

              Divider(height: 1,),

              SizedBox(height: 16),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Video Compressor\nQuality",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  SizedBox(width: 20),

                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF9994E8),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    
                    child: ToggleButtons(
                      renderBorder: false,
                      borderRadius: BorderRadius.circular(14),
                      fillColor: Color.fromARGB(255, 114, 109, 189),
                      selectedColor: Colors.white,
                      color: Colors.black,
                      isSelected: [
                        selectedIndex == 0,
                        selectedIndex == 1,
                        selectedIndex == 2,
                      ],
                      
                      onPressed: (int index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 9.0),
                          child: Text(
                            "Low",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 9.0),
                          child: Text(
                            "Medium",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 9.0),
                          child: Text(
                            "High",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24),

              SettingsOption(title: "Help and support"),
              
              SettingsOption(title: "Terms of use"),
              
              SettingsOption(title: "Privacy policy"),
              
              SettingsOption(title: "Redeem Promo Code"),
            ],
          ),
        ),
      ),
    );
  }
}
