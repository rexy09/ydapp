import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class DepartureCard extends StatelessWidget {
  final Function(Map<String, dynamic>) onDepartureSelected;
  final Map<String, dynamic> bookingData;
  final Map<String, dynamic> data;

  const DepartureCard(
      {super.key,
      required this.onDepartureSelected,
      required this.bookingData,
      required this.data});

  Widget leadingIcon() {
    if (bookingData['departure_time'] != null &&
        bookingData['departure_time']['id'] == data['id']) {
      return const Icon(
        Icons.check_box_outlined,
        size: 25,
        color: Colors.green,
      );
    } else {
      return const Icon(
        Icons.check_box_outline_blank_outlined,
        size: 25,
        color: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon(),
      title: Text(
        Jiffy.parse(data['departure_time'], pattern: 'h:mm:ss')
            .format(pattern: 'h:mm a'),
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      onTap: () {
        onDepartureSelected(data);
        Navigator.pop(context);
      },
    );
  }
}
