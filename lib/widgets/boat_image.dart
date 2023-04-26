import 'package:flutter/material.dart';

class BoatImage extends StatelessWidget {
  const BoatImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.pexels.com/photos/163236/luxury-yacht-boat-speed-water-163236.jpeg?auto=compress&cs=tinysrgb&w=1600"),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
