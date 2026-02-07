import 'package:flutter/widgets.dart';

class ResponsiveUtils {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double _scaleFactor;
  static late bool isLandscape;

  // Base design dimensions (Standard iPhone x/11/13/14 size)
  static const double baseWidth = 375;
  static const double baseHeight = 812;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    isLandscape = _mediaQueryData.orientation == Orientation.landscape;

    // Use the shortest side for scaling fonts and radii.
    // This ensures consistency across orientations and platforms.
    double shortestSide = isLandscape ? screenHeight : screenWidth;
    _scaleFactor = shortestSide / baseWidth;
  }

  // Width Scaling: Responsive for Web/Tablet (Capped to prevent bloat)
  static double setWidth(double width) {
    double scale = screenWidth / baseWidth;
    // For Desktop/Web, we cap the scale so buttons don't become 2 feet wide
    if (screenWidth > 1024) return width * 1.1;
    if (screenWidth > 600) return width * 1.25;
    return width * scale;
  }

  // Height Scaling
  static double setHeight(double height) {
    double scale = screenHeight / baseHeight;
    return height * scale;
  }

  // Font Scaling: Uses shortest side to prevent massive text in landscape
  static double setSp(double fontSize) => fontSize * _scaleFactor;

  // Radius Scaling
  static double setRadius(double radius) => radius * _scaleFactor;
}

// 2. The Extension
extension ResponsiveExtension on num {
  double get w => ResponsiveUtils.setWidth(toDouble());
  double get h => ResponsiveUtils.setHeight(toDouble());
  double get sp => ResponsiveUtils.setSp(toDouble());
  double get r => ResponsiveUtils.setRadius(toDouble());
}
