import 'package:flutter/material.dart';

class VideoBoxCard extends StatelessWidget {
  final String thumbnailPath;
  final String? sizeLabel;
  final bool isSelected;
  final bool showOriginal;

  const VideoBoxCard({
    super.key,
    required this.thumbnailPath,
    this.sizeLabel,
    required this.isSelected,
    this.showOriginal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFF6A5AE0), width: 2),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            Positioned.fill( // Fills the entire card with te image
              child: Image.asset(thumbnailPath, fit: BoxFit.cover),
            ),

            if (sizeLabel != null)
              Positioned(
                top: 8,
                left: 8,
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
              top: 8,
              right: 8,
              child: Icon(Icons.play_circle_fill, color: Colors.white, size: 20),
            ),

            if (showOriginal)
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(0xFF6A5AE0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Original Video",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? Color(0xFF6A5AE0) : Colors.white,
                  border: Border.all(color: Color(0xFF6A5AE0), width: 2),
                ),
                child: isSelected
                    ? Icon(Icons.check, size: 12, color: Colors.white)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}