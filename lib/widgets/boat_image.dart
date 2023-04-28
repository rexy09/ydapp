import 'package:flutter/material.dart';
import 'package:ydapp/widgets/boat_gallery.dart';

class BoatImage extends StatelessWidget {
  const BoatImage({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://images.pexels.com/photos/163236/luxury-yacht-boat-speed-water-163236.jpeg?auto=compress&cs=tinysrgb&w=1600";
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: GestureDetector(
        onTap: () {
          // Use extension method to use [TransparentRoute]
          // This will push page without route background
          // context.pushTransparentRoute(
          //   BoatImageView(imagePath: imageUrl),
          // );

          open(context, 0);
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  void open(BuildContext context, final int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BoatGallery(
            // galleryItems: galleryItems,
            // backgroundDecoration: const BoxDecoration(
            //   color: Colors.black,
            // ),
            // initialIndex: index,
            // scrollDirection: verticalGallery ? Axis.vertical : Axis.horizontal,
            ),
      ),
    );
  }
}
