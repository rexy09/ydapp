import 'package:flutter/material.dart';
import 'package:ydapp/screens/booking/trip_booking_details.dart';

class BookingCard extends StatelessWidget {
  BookingCard({super.key});

  final Map<String, dynamic> bookingData = <String, dynamic>{
    "destination": null,
    "date": null,
    "pickup": null,
    "departure_time": null,
    "return_time": null,
    "east_african": {
      "above_16_yrs": 0,
      "age_5_15_yrs": 0,
      "students": 0,
      "below_5_yrs": 0,
    },
    "non_east_african": {
      "above_16_yrs": 0,
      "age_5_15_yrs": 0,
      "students": 0,
      "below_5_yrs": 0,
    },
    "resident": {
      "above_16_yrs": 0,
      "age_5_15_yrs": 0,
      "students": 0,
      "below_5_yrs": 0,
    },
  };

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
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
              children: const [
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
              children: const [
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
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TripBookingDetails(bookingData: bookingData)));
      },
    );
  }
}
