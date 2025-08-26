import 'package:flutter/material.dart';

class ImageBoxCard extends StatelessWidget {
  final String imagePath;
  final String? sizeLabel;
  final bool isSelected;
  final bool showOriginal;

  const ImageBoxCard({
    super.key,
    required this.imagePath,
    this.sizeLabel,
    required this.isSelected,
    this.showOriginal = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color(0xFF6A5AE0),
          width: 2,
        ),
        color: Colors.white,
      ),
      
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),

            if (sizeLabel != null)
              Positioned(
                top: 6,
                right: 6,
                child: Text(
                  sizeLabel!,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (showOriginal)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFF6A5AE0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Original Photo",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected ? Color(0xFF6A5AE0) : Colors.white,
                      border: Border.all(
                        color: Color(0xFF6A5AE0),
                        width: 2,
                      ),
                    ),
                    child: isSelected
                        ? Icon(Icons.check, size: 12, color: Colors.white)
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}