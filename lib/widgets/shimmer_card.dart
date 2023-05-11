import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerCard extends StatelessWidget {
  final double width;
  final double height;
  /* final BorderRadius borderRadius; */

  const ShimmerCard({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      color: Colors.black12,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: const Color.fromARGB(160, 245, 245, 245),
        margin: const EdgeInsets.all(0),
        child: SizedBox(
          width: width,
          height: height,
        ),
      ),
    );
  }
}
