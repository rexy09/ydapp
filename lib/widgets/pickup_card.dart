import 'package:flutter/material.dart';

class PickupCard extends StatelessWidget {
  final Function(Map<String, dynamic>) onPickupSelected;
  final Map<String, dynamic> bookingData;
  final Map<String, dynamic> data;

  const PickupCard(
      {super.key,
      required this.onPickupSelected,
      required this.bookingData,
      required this.data});

  Widget leadingIcon() {
    if (bookingData['pickup'] != null &&
        bookingData['pickup']['id'] == data['id']) {
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
      title: const Text(
        "Slipway",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      onTap: () {
        onPickupSelected(data);
        Navigator.pop(context);
      },
    );
  }
}
