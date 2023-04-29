import 'package:flutter/material.dart';

class BookingCard extends StatefulWidget {
  const BookingCard({super.key});

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
            leading: const Icon(
              Icons.event_outlined,
              size: 40,
              color: Colors.white,
            ),
            title: const Text(
              "Mbudya",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              "May 2, 2023",
              style: TextStyle(color: Colors.white),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 75,
                  child: Row(
                    children: [
                      Icon(
                        Icons.north_east_outlined,
                        size: 15,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Text(
                        "09:00 am",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 75,
                  child: Row(
                    children: [
                      Icon(
                        Icons.south_west_outlined,
                        size: 15,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Text(
                        "17:00 pm",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}