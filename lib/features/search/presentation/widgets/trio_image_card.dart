import 'package:flutter/material.dart';

class TrioImageCard extends StatelessWidget {
  final String leftImage;
  final String topRightImage;
  final String bottomRightImage;
  final double borderRadius;
  final double spacing;
  final Color backgroundColor;
  final double height;

  const TrioImageCard({
    Key? key,
    required this.leftImage,
    required this.topRightImage,
    required this.bottomRightImage,
    this.borderRadius = 12,
    this.spacing = 4,
    this.backgroundColor = Colors.white,
    this.height = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: height,
        color: backgroundColor,
        child: Row(
          children: [
            // Left large image
            Expanded(
              flex: 2,
              child: Image.network(leftImage, fit: BoxFit.cover),
            ),
            SizedBox(width: spacing),
            // Right stacked images
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(topRightImage, fit: BoxFit.cover),
                  ),
                  SizedBox(height: spacing),
                  Expanded(
                    child: Image.network(bottomRightImage, fit: BoxFit.cover),
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
