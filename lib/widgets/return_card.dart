import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class ReturnCard extends StatelessWidget {
  final Function(Map<String, dynamic>) onReturnSelected;
  final Map<String, dynamic> bookingData;
  final Map<String, dynamic> data;

  const ReturnCard(
      {super.key,
      required this.onReturnSelected,
      required this.bookingData,
      required this.data});

  Widget leadingIcon() {
    if (bookingData['return_time'] != null &&
        bookingData['return_time']['id'] == data['id']) {
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
        Jiffy.parse(data['return_time'], pattern: 'h:mm:ss')
            .format(pattern: 'h:mm a'),
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      onTap: () {
        onReturnSelected(data);
        Navigator.pop(context);
      },
    );
  }
}
