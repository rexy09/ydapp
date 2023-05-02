import 'package:flutter/material.dart';
import 'package:ydapp/widgets/boat_gallery.dart';

class DestinationDetails extends StatefulWidget {
  const DestinationDetails({super.key});

  @override
  State<DestinationDetails> createState() => _DestinationDetailsState();
}

class _DestinationDetailsState extends State<DestinationDetails> {
  

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 64, 72),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            backgroundColor: const Color.fromARGB(255, 16, 64, 72),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  const EdgeInsetsDirectional.only(start: 16.0, bottom: 16.0),
              centerTitle: false,
              title: const Text(
                'Mbudya',
                textScaleFactor: 0.8,
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                child: Image.network(
                  'https://wildlifesafaritanzania.com/wp-content/uploads/2022/11/How-to-get-to-Mbudya-Island.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Mbudya Island is a small uninhabited island located off the coast of Dar es Salaam, Tanzania. It is part of the Dar es Salaam Marine Reserve and is a popular destination for day trips and weekend getaways. The island is known for its crystal-clear waters and coral reefs, which are ideal for snorkeling and scuba diving. Visitors can also enjoy sunbathing on the white sand beaches, picnicking in the shade of the island's trees, and exploring the island's rocky coves and tidal pools. There are no permanent facilities on the island, but visitors can rent beach umbrellas, beach chairs, and snorkeling equipment from local vendors.",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(1.0),
                child: InkWell(
                  onTap: () {
                    open(context, 0);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://wildlifesafaritanzania.com/wp-content/uploads/2022/11/How-to-get-to-Mbudya-Island.jpg"),
                          fit: BoxFit.cover),
                      color: Colors.white70,
                    ),
                  ),
                ),
              );
            }, childCount: 8),
          ),
        ],
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
