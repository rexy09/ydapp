import 'package:flutter/material.dart';
import 'package:ydapp/widgets/pickup_card.dart';

class Pickups extends StatefulWidget {
  const Pickups({super.key});

  @override
  State<Pickups> createState() => _PickupsState();
}

class _PickupsState extends State<Pickups> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Popular ports",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              itemCount: 2,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return const PickupCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
