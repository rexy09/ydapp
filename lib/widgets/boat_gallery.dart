import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class BoatGallery extends StatefulWidget {
  const BoatGallery({super.key});

  @override
  State<BoatGallery> createState() => _BoatGalleryState();
}

class _BoatGalleryState extends State<BoatGallery> {
  List galleryItems = [
    "https://images.pexels.com/photos/163236/luxury-yacht-boat-speed-water-163236.jpeg?auto=compress&cs=tinysrgb&w=1600",
    "https://images.pexels.com/photos/1007836/pexels-photo-1007836.jpeg?auto=compress&cs=tinysrgb&w=1600",
    "https://images.pexels.com/photos/271681/pexels-photo-271681.jpeg?auto=compress&cs=tinysrgb&w=1600"
  ];
  late int currentIndex = 0;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
          color: Colors.transparent,
          child: PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(galleryItems[index]),
                initialScale: PhotoViewComputedScale.contained * 0.95,
                // heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
              );
            },
            itemCount: galleryItems.length,
            loadingBuilder: (context, event) => const Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              ),
            ),
            backgroundDecoration: const BoxDecoration(
              color: Colors.black,
            ),
            pageController: PageController(initialPage: currentIndex),
            onPageChanged: onPageChanged,
          )),
    );
  }
}
