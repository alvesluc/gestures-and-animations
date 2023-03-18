import 'dart:developer';

import 'package:flutter/material.dart';

class PinchHandler extends StatefulWidget {
  const PinchHandler({super.key});

  @override
  State<PinchHandler> createState() => _AnimatedPinchHandler();
}

class _AnimatedPinchHandler extends State<PinchHandler> {
  double scale = 1;

  void onScaleUpdate(ScaleUpdateDetails details) {
    log('onScaleUpdate');
    setState(() {
      scale = details.scale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleUpdate: onScaleUpdate,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.width,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        height: 100 * scale,
        width: 100 * scale,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
