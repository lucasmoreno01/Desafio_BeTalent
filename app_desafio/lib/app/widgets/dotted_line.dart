import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  final double height;
  final double dashWidth;
  final double dashSpacing;
  final Color color;

  const DottedLine({
    super.key,
    required this.height,
    required this.dashWidth,
    required this.dashSpacing,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final dashCount = (totalWidth / (dashWidth + dashSpacing)).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return Container(
              width: dashWidth,
              height: height,
              color: color,
            );
          }),
        );
      },
    );
  }
}
