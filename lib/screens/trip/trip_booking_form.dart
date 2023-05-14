import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:ydapp/data/repositories/booking_option_repository.dart';
import 'package:ydapp/logic/bloc/booking_bloc.dart';
import 'package:ydapp/logic/bloc/booking_option_bloc.dart';
import 'package:ydapp/widgets/money_format.dart';

class TripBookingForm extends StatefulWidget {
  final Map<String, dynamic> bookingData;
  const TripBookingForm({super.key, required this.bookingData});

  @override
  State<TripBookingForm> createState() => _TripBookingFormState();
}

class _TripBookingFormState extends State<TripBookingForm> {
  BookingOptionRepository bookingOptionRepository = BookingOptionRepository();

  late final BookingBloc bookingBloc;
  late final BookingOptionBloc bookingOptionBloc;
  late Map tripCost = {};

  String totalPasengers() {
    int total = 0;
    widget.bookingData['east_african'].forEach((key, value) {
      total += int.parse("$value");
    });
    widget.bookingData['non_east_african'].forEach((key, value) {
      total += int.parse("$value");
    });
    widget.bookingData['resident'].forEach((key, value) {
      total += int.parse("$value");
    });
    return "$total";
  }

  String tripDate = "dd mm, yyy";
  String _tripDateFormat() {
    List dateList = widget.bookingData['date'].split("-");
    String tripDate = DateFormat('dd MMMM, yyyy').format(DateTime(
      int.parse(dateList[0]),
      int.parse(dateList[1]),
      int.parse(dateList[2]),
    ));
    return tripDate;
  }

  @override
  void initState() {
    bookingBloc = BookingBloc(bookingOptionRepository: bookingOptionRepository);
    bookingOptionBloc =
        BookingOptionBloc(bookingOptionRepository: bookingOptionRepository);
    bookingOptionBloc
        .add(FetchBookingTripCost(bookingData: widget.bookingData));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 64, 72),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Trip Booking"),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: RefreshIndicator(
          onRefresh: () async {
            bookingOptionBloc
                .add(FetchBookingTripCost(bookingData: widget.bookingData));
          },
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
                      style: const TextStyle(
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
                    Text(
                      '${widget.bookingData['pickup'] != null ? widget.bookingData['pickup']['name'] : widget.bookingData['pickup']}',
                      textScaleFactor: 1.1,
                      style: const TextStyle(
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
                    Text(
                      widget.bookingData['date'] != null
                          ? _tripDateFormat()
                          : tripDate,
                      textScaleFactor: 1.1,
                      style: const TextStyle(
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
                        Text(
                          '${widget.bookingData['departure_time'] != null ? Jiffy.parse(widget.bookingData['departure_time']['departure_time'], pattern: 'h:mm:ss').format(pattern: 'h:mm a') : widget.bookingData['departure_time']}',
                          textScaleFactor: 1.1,
                          style: const TextStyle(
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
                        Text(
                          '${widget.bookingData['return_time'] != null ? Jiffy.parse(widget.bookingData['return_time']['return_time'], pattern: 'h:mm:ss').format(pattern: 'h:mm a') : widget.bookingData['return_time']}',
                          textScaleFactor: 1.1,
                          style: const TextStyle(
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
                    InkWell(
                      onTap: () {
                        _passengerModalBottomSheet(context);
                      },
                      child: Row(
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
                            'Passengers',
                            textScaleFactor: 1.1,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "${totalPasengers()}",
                      textScaleFactor: 1.1,
                      style: const TextStyle(
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
                  children: [
                    const Text(
                      'Subtotal',
                      textScaleFactor: 1.1,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    BlocBuilder<BookingOptionBloc, BookingOptionState>(
                      bloc: bookingOptionBloc,
                      builder: (context, state) {
                        if (state is BookingTripCostLoaded) {
                          return Text(
                            '${moneyFormatter(state.tripCost['subtotal'])} TZS',
                            textScaleFactor: 1.1,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          );
                        }
                        return const Text(
                          '----',
                          textScaleFactor: 1.1,
                          style: TextStyle(
                            letterSpacing: 5,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      },
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
                    const Text(
                      'Service Charge',
                      textScaleFactor: 1.1,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    BlocBuilder<BookingOptionBloc, BookingOptionState>(
                      bloc: bookingOptionBloc,
                      builder: (context, state) {
                        if (state is BookingTripCostLoaded) {
                          return Text(
                            '+ ${moneyFormatter(double.parse('${state.tripCost['service_fee']}'))} TZS',
                            textScaleFactor: 1.1,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          );
                        }
                        return const Text(
                          '----',
                          textScaleFactor: 1.1,
                          style: TextStyle(
                            letterSpacing: 5,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      },
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
                  children: [
                    const Text(
                      'Total',
                      textScaleFactor: 1.1,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    BlocBuilder<BookingOptionBloc, BookingOptionState>(
                      bloc: bookingOptionBloc,
                      builder: (context, state) {
                        if (state is BookingTripCostLoaded) {
                          return Text(
                            '${moneyFormatter(double.parse('${state.tripCost['total_amount']}'))} TZS',
                            textScaleFactor: 1.1,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        return const Text(
                          '----',
                          textScaleFactor: 1.1,
                          style: TextStyle(
                            letterSpacing: 5,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      },
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
                    BlocConsumer<BookingOptionBloc, BookingOptionState>(
                      bloc: bookingOptionBloc,
                      listener: (context, state) {
                        if (state is BookingTripCostLoaded) {
                          tripCost = state.tripCost;
                          setState(() {});
                        }
                      },
                      builder: (context, state) {
                        if (state is BookingOptionLoading) {
                          return Container(
                              width: deviceWidth,
                              height: 50,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                              ),
                              child: const Center(
                                child: CupertinoActivityIndicator(
                                  color: Colors.black,
                                ),
                              ));
                        }
                        return InkWell(
                          onTap: () {
                            _paymentModalBottomSheet(context,
                                title: "Eddy Biggz");
                          },
                          child: Container(
                            width: deviceWidth,
                            height: 50,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: const Center(
                                child: Text(
                              "Continue Pay",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                          ),
                        );
                      },
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
      ),
    );
  }

  Widget _ageCard({required String title, required Map ageData}) {
    return Column(
      children: [
        Text(
          title,
          textScaleFactor: 1.15,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Above 16 years',
              textScaleFactor: 1.1,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "${ageData['above_16_yrs']}",
              textScaleFactor: 1.1,
              style: const TextStyle(
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
          children: [
            const Text(
              '5-15 years',
              textScaleFactor: 1.1,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "${ageData['age_5_15_yrs']}",
              textScaleFactor: 1.1,
              style: const TextStyle(
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
          children: [
            const Text(
              'Students',
              textScaleFactor: 1.1,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "${ageData['students']}",
              textScaleFactor: 1.1,
              style: const TextStyle(
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
          children: [
            const Text(
              'Below 5 years',
              textScaleFactor: 1.1,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "${ageData['below_5_yrs']}",
              textScaleFactor: 1.1,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  void _passengerModalBottomSheet(context) {
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
          height: deviceHeight * 0.9,
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
                      children: const [
                        Text(
                          "Passengers",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.people_outline,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _ageCard(
                        title: "East African",
                        ageData: widget.bookingData['east_african']),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    _ageCard(
                        title: "Non East African",
                        ageData: widget.bookingData['non_east_african']),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    _ageCard(
                        title: "Resident",
                        ageData: widget.bookingData['resident']),
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
                          "Ok",
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
                        const Text(
                          "Payment Methods",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${moneyFormatter(double.parse('${tripCost['total_amount']}'))} TZS',
                          textScaleFactor: 1.2,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ListTile(
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
                    const ListTile(
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
                    const ListTile(
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
                    const ListTile(
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
}
