import 'dart:math';

import 'package:pinterest_clone/main_index.dart';

class PinterestRefreshIndicator extends StatefulWidget {
  final Future<void> Function() onRefresh;
  final Widget child;
  const PinterestRefreshIndicator({
    required this.onRefresh,
    required this.child,
    super.key,
  });

  @override
  State<PinterestRefreshIndicator> createState() =>
      _PinterestRefreshIndicatorState();
}

class _PinterestRefreshIndicatorState extends State<PinterestRefreshIndicator> {
  // Tracks raw pixel scroll distance
  double _scrollOffset = 0.0;
  // The distance to trigger the refresh (and hold it during loading)
  final double _triggerDistance = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.amber),
      body: SafeArea(
        child: CustomRefreshIndicator(
          offsetToArmed: _triggerDistance,
          // The actual refresh logic
          onRefresh: () async => widget.onRefresh,
          builder: (context, child, controller) {
            return AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                // 1. Calculate the exact distance the grid is pushed down
                final double pullDistance = controller.isLoading
                    ? (controller.value * _triggerDistance)
                    : (_scrollOffset < 0 ? _scrollOffset.abs() : 0.0);

                // 2. Entrance & Rotation math
                final double rotationPercent = (pullDistance / _triggerDistance)
                    .clamp(0.0, 1.0);
                final double rotationAngle = rotationPercent * 2 * pi;

                // We start fading/scaling once we pull 30px, fully visible by 60px
                final double effectSmoothness = (pullDistance / 60).clamp(
                  0.0,
                  1.0,
                );

                return Stack(
                  alignment: .topCenter,
                  children: [
                    // THE CONTENT: The GridView moves 1:1 with your finger
                    Transform.translate(
                      offset: Offset(0, pullDistance),
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (notification is ScrollUpdateNotification) {
                            setState(
                              () => _scrollOffset = notification.metrics.pixels,
                            );
                          }
                          return false;
                        },
                        child: child,
                      ),
                    ),

                    // THE LOADER: Fixed 5px gap math
                    if (!controller.isIdle)
                      Positioned(
                        // FORMULA:
                        // pullDistance (where the grid starts)
                        // - 46 (the actual height of our red circle)
                        // - 5 (your requested gap)
                        // Total = pullDistance - 51
                        top: pullDistance - 51,
                        child: Opacity(
                          opacity: effectSmoothness,
                          child: Transform.rotate(
                            angle: rotationAngle,
                            child: Transform.scale(
                              scale: effectSmoothness,
                              child: _PinterestCircle(
                                isLoading: controller.isLoading,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            );
          },
          child: widget.child,
        ),
      ),
    );
  }
}

class _PinterestCircle extends StatelessWidget {
  final bool isLoading;
  const _PinterestCircle({required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: const BoxDecoration(
        color: AppColors.grayDim,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: _PinterestDots(isRotating: isLoading),
    );
  }
}

class _PinterestDots extends StatefulWidget {
  final bool isRotating;
  const _PinterestDots({required this.isRotating});

  @override
  State<_PinterestDots> createState() => _PinterestDotsState();
}

class _PinterestDotsState extends State<_PinterestDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
    if (widget.isRotating) _rotationController.repeat();
  }

  @override
  void didUpdateWidget(_PinterestDots oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRotating && !_rotationController.isAnimating) {
      _rotationController.repeat();
    } else if (!widget.isRotating && _rotationController.isAnimating) {
      _rotationController.stop();
    }
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotationController,
      child: SizedBox(
        width: 15,
        height: 15,
        child: GridView.count(
          padding: EdgeInsets.zero,
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            4,
            (_) => const DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.black,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
