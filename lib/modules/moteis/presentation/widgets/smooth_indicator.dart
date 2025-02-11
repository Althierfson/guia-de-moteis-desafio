import 'package:flutter/material.dart';

class SmoothIndicator extends AnimatedWidget {
  final PageController controller;
  final int itemCount;
  final double indicatorSize;
  final double indicatorSpacing;
  final Color activeColor;
  final Color inactiveColor;

  const SmoothIndicator({
    super.key,
    required this.controller,
    required this.itemCount,
    this.indicatorSize = 10.0,
    this.indicatorSpacing = 8.0,
    this.activeColor = Colors.grey,
    this.inactiveColor = const Color(0xff666666),
  }) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    double page = controller.page ?? controller.initialPage.toDouble();
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        double selectedness = (1 - (page - index).abs()).clamp(0.0, 1.0);
        double size = indicatorSize + (indicatorSize * 0.5 * selectedness);

        return Container(
          width: size,
          height: size,
          margin: EdgeInsets.symmetric(horizontal: indicatorSpacing / 2),
          decoration: BoxDecoration(
            color: Color.lerp(inactiveColor, activeColor, selectedness),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
