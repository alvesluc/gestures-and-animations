import 'dart:developer';

import 'package:flutter/material.dart';

class AnimatedTapsHandler extends StatefulWidget {
  const AnimatedTapsHandler({super.key});

  @override
  State<AnimatedTapsHandler> createState() => _AnimatedTapsHandler();
}

class _AnimatedTapsHandler extends State<AnimatedTapsHandler> {
  final animationDuration = const Duration(milliseconds: 500);
  double containerHeight = 100;
  double containerWidth = 100;
  bool isColorToggled = false;

  void onTapDown(TapDownDetails details) {
    log('onTapDown');
    setState(() {
      containerHeight = 150;
      containerWidth = 150;
    });
  }

  void onTapUp(TapUpDetails details) {
    log('onTapUp');
    shrinkContainer();
  }

  void onTapCancel() {
    log('onTapCancel');
    shrinkContainer();
  }

  void shrinkContainer() {
    setState(() {
      containerHeight = 100;
      containerWidth = 100;
    });
  }

  void onDoubleTap() {
    log('onDoubleTap');
    setState(() => isColorToggled = !isColorToggled);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onDoubleTap: onDoubleTap,
      onTapCancel: onTapCancel,
      child: AnimatedContainer(
        height: containerHeight,
        width: containerWidth,
        curve: Curves.easeIn,
        duration: animationDuration,
        decoration: BoxDecoration(
          color: isColorToggled ? Colors.blue : Colors.purple,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
