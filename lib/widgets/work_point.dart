import 'package:flutter/material.dart';
import 'package:portfolio/widgets/bullet.dart';

class WorkPoint extends StatelessWidget {
  final Widget data;
  const WorkPoint({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            transform: Matrix4.translationValues(0.0, 4.0, 0.0),
            child: const Bullet(),
          ),
          const SizedBox(width: 15),
          Flexible(child: data),
        ],
      ),
    );
  }
}
