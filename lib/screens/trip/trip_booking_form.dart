import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TripBookingForm extends StatefulWidget {
  final Map<String, dynamic> bookingData;
  const TripBookingForm({super.key, required this.bookingData});

  @override
  State<TripBookingForm> createState() => _TripBookingFormState();
}

class _TripBookingFormState extends State<TripBookingForm> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 16, 64, 72),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Trip Booking"),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          // controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.place,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Destination',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${widget.bookingData['destination'] != null ? widget.bookingData['destination']['name'] : widget.bookingData['destination']}',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.near_me_outlined,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Pickup',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Slipway',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.event,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Date',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'May 2, 2023',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.schedule,
                            color: Colors.white,
                            size: 15,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'Departure',
                            textScaleFactor: 1.1,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '09:00 am',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.schedule,
                            color: Colors.white,
                            size: 15,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'Return',
                            textScaleFactor: 1.1,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '17:00 pm',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Perssengers',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    '15',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Subtotal',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '56,000 TZS',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Service Charge',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '+ 5,600 TZS',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Total',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '61,600 TZS',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'full name*',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusColor: Colors.white,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'phone number*',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusColor: Colors.white,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'email',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusColor: Colors.white,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _paymentModalBottomSheet(context, title: "Eddy Biggz");
                    },
                    child: Container(
                      width: deviceWidth,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: const Center(
                          child: Text(
                        "Continue Pay",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _paymentModalBottomSheet(context, {required String title}) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;

  showModalBottomSheet(
    isScrollControlled: true,
    useSafeArea: true,
    elevation: 0,
    backgroundColor: Colors.black,
    barrierColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    context: context,
    builder: (BuildContext bc) {
      return Container(
        height: deviceHeight * 0.6,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Payment Methods",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '61,600 TZS',
                        textScaleFactor: 1.2,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text(
                      "Master Card",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.ccMastercard,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      "Visa",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.ccVisa,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      "Apple Pay",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.ccApplePay,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      "Paypal",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.ccPaypal,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: deviceWidth,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: const Center(
                          child: Text(
                        "Pay Now",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
