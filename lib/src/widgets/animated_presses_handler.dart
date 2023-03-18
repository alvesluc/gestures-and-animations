import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AnimatedPressesHandler extends StatefulWidget {
  const AnimatedPressesHandler({super.key});

  @override
  State<AnimatedPressesHandler> createState() => _AnimatedPressesHandler();
}

class _AnimatedPressesHandler extends State<AnimatedPressesHandler> {
  final animationDuration = const Duration(milliseconds: 500);
  double containerHeight = 100;
  double containerWidth = 100;

  void onLongPressDown(LongPressDownDetails details) {
    log('onLongPressDown');
    setState(() {
      containerHeight += 200;
      containerWidth += 200;
    });
  }

  void onLongPressEnd(LongPressEndDetails details) {
    log('onLongPressEnd');
    setState(() {
      containerHeight = 100;
      containerWidth = 100;
    });
  }

  void onLongPressCancel() {
    log('onLongPressCancel');
    setState(() {
      containerHeight = 100;
      containerWidth = 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressDown: onLongPressDown,
      onLongPressCancel: onLongPressCancel,
      onLongPressEnd: onLongPressEnd,
      child: AnimatedContainer(
        height: containerHeight,
        width: containerWidth,
        curve: Curves.easeIn,
        duration: animationDuration,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
