import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class View extends StatelessWidget {
  const View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333333),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AnimatedTapsHandler(),
            SizedBox(height: 20),
            AnimatedPressesHandler(),
            SizedBox(height: 20),
            AnimatedRotationHandler(),
            SizedBox(height: 20),
            PinchHandler(),
            SizedBox(height: 20),
            PanHandler(),
          ],
        ),
      ),
    );
  }
}
