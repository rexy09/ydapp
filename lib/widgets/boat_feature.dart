import 'package:flutter/material.dart';

class BoatFeature extends StatelessWidget {
  const BoatFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        height: 100,
        constraints: const BoxConstraints(minWidth: 100),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromARGB(110, 158, 158, 158)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bed_outlined,
              color: Colors.white,
            ),
            const Text(
              '2 Bed',
              textScaleFactor: 1,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
