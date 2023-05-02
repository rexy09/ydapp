import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ydapp/widgets/booking_card.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Bookings",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              itemCount: 10,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                //  if (state.hasReachedMax) {
                //   _scrollController.removeListener(_scrollListener);
                // } else {
                //   _scrollController.addListener(_scrollListener);
                // }
                // var receipt = receipts[index];
                return BookingCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}
