import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pinterest_clone/core/widgets/animation/shimmer_animation.dart';

class CarouselImageCard extends StatelessWidget {
  final String imageUrl;

  const CarouselImageCard({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: double.maxFinite,
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          ShimmerAnimation(child: Container(color: Colors.grey[800])),
      errorWidget: (context, url, error) =>
          Center(child: Icon(Icons.error, color: Colors.red)),
    );
  }
}
