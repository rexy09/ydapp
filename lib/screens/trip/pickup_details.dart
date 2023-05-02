import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickupDetails extends StatefulWidget {
  const PickupDetails({super.key});

  @override
  State<PickupDetails> createState() => _PickupDetailsState();
}

class _PickupDetailsState extends State<PickupDetails> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const LatLng sourceLocation =
      LatLng(-6.750811672716258, 39.27121631380092);
  BitmapDescriptor mapIcon = BitmapDescriptor.defaultMarker;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 64, 72),
      // backgroundColor: const Color.fromARGB(255, 1, 33, 41),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
            // backgroundColor: const Color.fromARGB(255, 1, 33, 41),
            backgroundColor: const Color.fromARGB(255, 16, 64, 72),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  const EdgeInsetsDirectional.only(start: 16.0, bottom: 16.0),
              centerTitle: false,
              title: const Text(
                'Slipway',
                textScaleFactor: 0.8,
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                child: Image.network(
                  'https://q-xx.bstatic.com/xdata/images/hotel/max1024x768/353441642.jpg?k=9dc1c4aa1c9d62308b13679c6d01ab8396f8f388e8120533b0b5c17851f94d8a&o=',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.explore_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const Text(
                        'Dar es salaam, Masaki, Tanzania',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Bongoyo Island Ferry Terminal is a port located in Dar es Salaam, Tanzania. It is the main terminal for ferries going to Bongoyo Island, a popular tourist destination known for its white sandy beaches and crystal-clear waters. The ferry terminal provides regular services to the island, with various tour operators offering day trips and excursions. It is also a hub for local fishermen who use the terminal to transport their catches to nearby markets. The terminal is equipped with basic facilities including restrooms, restaurants, and souvenir shops.',
                    // textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Pickup location",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    child: GoogleMap(
                      tiltGesturesEnabled: true,
                      zoomGesturesEnabled: true, //enable Zoom in, out on map
                      mapType: MapType.normal,
                      initialCameraPosition: const CameraPosition(
                        target: sourceLocation,
                        zoom: 18.0, //initial zoom level
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      markers: {
                        Marker(
                          markerId: const MarkerId("currentLocation"),
                          position: sourceLocation,
                          icon: mapIcon,
                        ),
                      },
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     bookingDataReset();
                  //   },
                  //   child: Container(
                  //     width: deviceWidth,
                  //     height: 50,
                  //     decoration: const BoxDecoration(
                  //       borderRadius: BorderRadius.all(Radius.circular(10)),
                  //       color: Color.fromARGB(100, 0, 0, 0),
                  //     ),
                  //     child: const Center(
                  //         child: Text(
                  //       "Reset",
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.white,
                  //       ),
                  //     )),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
