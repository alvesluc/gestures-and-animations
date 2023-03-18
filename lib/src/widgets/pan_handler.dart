import 'dart:developer';

import 'package:flutter/material.dart';

class PanHandler extends StatefulWidget {
  const PanHandler({super.key});

  @override
  State<PanHandler> createState() => _PanHandler();
}

class _PanHandler extends State<PanHandler> {
  var offset = const Offset(0, 0);

  void onPanUpdate(DragUpdateDetails details) {
    log('onPanUpdate');
    setState(() {
      offset = Offset(
        details.localPosition.dx - 50,
        details.localPosition.dy - 50,
      );
    });
  }

  void resetOffset() {
    log('resetOffset');
    setState(() {
      offset = const Offset(0, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: resetOffset,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.width,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.cyan[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text('Reset drag'),
            ),
          ),
        ),
        GestureDetector(
          onPanUpdate: onPanUpdate,
          child: Transform.translate(
            offset: offset,
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.width,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
