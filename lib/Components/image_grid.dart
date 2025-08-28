import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {

  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String title;

  const ImageGrid({
    super.key,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Container(
          width: 170,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFFE9EAFF),
            borderRadius: BorderRadius.circular(30),
          ),

          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            children: [

              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                ),
                child: Image.asset(
                  image1,
                  fit: BoxFit.cover,
                ),
              ),

              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  image2,
                  fit: BoxFit.cover,
                ),
              ),

              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20), 
                ),
                child: Image.asset(
                 image3,
                  fit: BoxFit.cover,
                ),
              ),

              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                ),
                child: Image.asset(
                  image4,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2),
 
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}

