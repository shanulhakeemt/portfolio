import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/triangular_bullet.dart';

class Bullet extends StatelessWidget {
  const Bullet({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 90 * math.pi / 180,
      child: CustomPaint(
        painter: TriangularBullet(),
        child: const SizedBox(
          height: 8,
          width: 10,
        ),
      ),
    );
  }
}
