import 'package:flutter/material.dart';

class QuadImageCard extends StatelessWidget {
  final List<String> images; // Should contain exactly 4 image URLs
  final double borderRadius;
  final double spacing;
  final double height;
  final Color backgroundColor;

  const QuadImageCard({
    required this.images,
    this.borderRadius = 12,
    this.spacing = 4,
    this.height = 100,
    this.backgroundColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: height,
        color: backgroundColor,
        child: Row(
          children: List.generate(4, (index) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 0 : spacing / 2,
                  right: index == 3 ? 0 : spacing / 2,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Image.network(images[index], fit: BoxFit.cover),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
