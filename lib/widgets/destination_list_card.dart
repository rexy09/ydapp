import 'package:flutter/material.dart';

class DestinationListCard extends StatelessWidget {
  final Function(Map<String, dynamic>) onDestinationSelected;
  final Map<String, dynamic> bookingData;
  final Map<String, dynamic> data;

  const DestinationListCard(
      {super.key,
      required this.onDestinationSelected,
      required this.bookingData,
      required this.data});

  Widget leadingIcon() {
    if (bookingData['destination'] != null &&
        bookingData['destination']['id'] == data['id']) {
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
        data['name'],
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        "${data['price']} TZS",
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {
        onDestinationSelected(data);
        Navigator.pop(context);
      },
    );
  }
}
