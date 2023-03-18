import 'dart:developer';

import 'package:flutter/material.dart';

class AnimatedRotationHandler extends StatefulWidget {
  const AnimatedRotationHandler({super.key});

  @override
  State<AnimatedRotationHandler> createState() => _AnimatedRotationHandler();
}

class _AnimatedRotationHandler extends State<AnimatedRotationHandler> {
  double angle = 0.0;

  void onPanUpdateHandler(DragUpdateDetails details) {
    log('onPanUpdateHandler');
    setState(() {
      angle = details.localPosition.direction;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: onPanUpdateHandler,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
