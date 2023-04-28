import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BoatImageView extends StatelessWidget {
  final String imagePath;

  const BoatImageView({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: () => Navigator.of(context).pop(),
      // Start of the optional properties
      isFullScreen: false,
      disabled: false,
      minRadius: 10,
      maxRadius: 10,
      dragSensitivity: 1.0,
      maxTransformValue: .8,
      direction: DismissiblePageDismissDirection.multi,
      backgroundColor: Colors.black,
      onDragStart: () {
        if (kDebugMode) {
          print('onDragStart');
        }
      },
      onDragUpdate: (details) {
        if (kDebugMode) {
          print(details);
        }
      },
      dismissThresholds: const {
        DismissiblePageDismissDirection.vertical: .2,
      },
      minScale: .8,
      startingOpacity: 1,
      reverseDuration: const Duration(milliseconds: 250),
      // End of the optional properties
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Image.network(imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
