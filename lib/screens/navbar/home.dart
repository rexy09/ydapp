import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:ydapp/screens/trip/destinations.dart';
import 'package:ydapp/screens/trip/pickups.dart';
import 'package:ydapp/screens/trip/trip_booking_form.dart';
import 'package:ydapp/widgets/departure_card.dart';
import 'package:ydapp/widgets/destination_list_card.dart';
import 'package:ydapp/widgets/pickup_list_card.dart';
import 'package:ydapp/widgets/return_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scrollController = ScrollController();
  final TextEditingController eastAfrican = TextEditingController();
  final TextEditingController nonEastAfrican = TextEditingController();
  final TextEditingController resident = TextEditingController();

  Map<String, dynamic> bookingData = <String, dynamic>{
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

  Map<String, dynamic> bookingOptions = <String, dynamic>{
    "destinations": [
      {"id": 1, "name": "Mbudya"}
    ]
  };

  String tripDate = "dd mm, yyy";

  void _onDateSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    bookingData['date'] = DateFormat('yyyy-MM-dd').format(args.value);
    tripDate = DateFormat('dd MMMM, yyyy').format(args.value);
    setState(() {});
  }

  void onDestinationSelected(Map<String, dynamic> data) {
    bookingData['destination'] = data;
    setState(() {});
  }

  void onPickupSelected(Map<String, dynamic> data) {
    bookingData['pickup'] = data;
    setState(() {});
  }

  void onDepartureSelected(Map<String, dynamic> data) {
    bookingData['departure_time'] = data;
    setState(() {});
  }

  void onReturnSelected(Map<String, dynamic> data) {
    bookingData['return_time'] = data;
    setState(() {});
  }

  void onPassengerChanged(String key) {
    bookingData['east_african'][key] =
        eastAfrican.text.isNotEmpty ? int.parse(eastAfrican.text) : 0;
    bookingData['non_east_african'][key] =
        nonEastAfrican.text.isNotEmpty ? int.parse(nonEastAfrican.text) : 0;
    bookingData['resident'][key] =
        resident.text.isNotEmpty ? int.parse(resident.text) : 0;
    setState(() {});
    eastAfrican.clear();
    nonEastAfrican.clear();
    resident.clear();
  }

  Future<void> bookingDataReset() async {
    bookingData = <String, dynamic>{
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
    tripDate = "dd mm, yyy";
    setState(() {});
  }

  String totalPasengers(String key) {
    int total = bookingData['east_african'][key] +
        bookingData['non_east_african'][key] +
        bookingData['resident'][key];
    return "$total";
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: RefreshIndicator(
        onRefresh: () async {
          bookingDataReset();
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Start your sea trip with',
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      letterSpacing: 4,
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Text(
                    'Yachts & Dhows',
                    textScaleFactor: 1.5,
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
              Column(
                children: [
                  TextFormField(
                    showCursor: false,
                    readOnly: true,
                    controller: TextEditingController(
                        text: bookingData['destination'] != null
                            ? bookingData['destination']['name']
                            : bookingData['destination']),
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'destination*',
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
                      suffixIcon: Icon(Icons.place_outlined),
                      suffixIconColor: Colors.white,
                    ),
                    onTap: () {
                      _destinationModalBottomSheet(context);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    showCursor: false,
                    readOnly: true,
                    controller: TextEditingController(text: tripDate),
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.none,
                    decoration: const InputDecoration(
                      hintText: 'dd mm, yyyy',
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: 'date*',
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
                      suffixIcon: Icon(Icons.event_outlined),
                      suffixIconColor: Colors.white,
                    ),
                    onTap: () {
                      pickDateBottomSheet(context);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    showCursor: false,
                    readOnly: true,
                    controller: TextEditingController(
                        text: bookingData['pickup'] != null
                            ? bookingData['pickup']['name']
                            : bookingData['pickup']),
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'pickup*',
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
                      suffixIcon: Icon(Icons.near_me_outlined),
                      suffixIconColor: Colors.white,
                    ),
                    onTap: () {
                      _pickupModalBottomSheet(context);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: deviceWidth * 0.45,
                        child: TextFormField(
                          showCursor: false,
                          readOnly: true,
                          controller: TextEditingController(
                              text: bookingData['departure_time'] != null
                                  ? bookingData['departure_time']['name']
                                  : bookingData['departure_time']),
                          cursorColor: Colors.white,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'hh:mm',
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: 'departure*',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusColor: Colors.white,
                            fillColor: Colors.white,
                            suffixIcon: Icon(Icons.schedule_outlined),
                            suffixIconColor: Colors.white,
                          ),
                          onTap: () {
                            _departureModalBottomSheet(context);
                          },
                        ),
                      ),
                      SizedBox(
                        width: deviceWidth * 0.45,
                        child: TextFormField(
                          showCursor: false,
                          readOnly: true,
                          controller: TextEditingController(
                              text: bookingData['return_time'] != null
                                  ? bookingData['return_time']['name']
                                  : bookingData['return_time']),
                          cursorColor: Colors.white,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'hh:mm',
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: 'return*',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusColor: Colors.white,
                            fillColor: Colors.white,
                            suffixIcon: Icon(Icons.schedule_outlined),
                            suffixIconColor: Colors.white,
                          ),
                          onTap: () {
                            _returnModalBottomSheet(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: deviceWidth * 0.45,
                        child: TextFormField(
                          controller: TextEditingController(
                              text: totalPasengers("above_16_yrs")),
                          readOnly: true,
                          cursorColor: Colors.white,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'above 16 years',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusColor: Colors.white,
                            fillColor: Colors.white,
                            suffixIcon: Icon(Icons.people_outline),
                            suffixIconColor: Colors.white,
                          ),
                          onTap: () {
                            _passengerModalBottomSheet(context,
                                title: 'Above 16 years',
                                passengerKey: "above_16_yrs");
                          },
                        ),
                      ),
                      SizedBox(
                        width: deviceWidth * 0.45,
                        child: TextFormField(
                          controller: TextEditingController(
                              text: totalPasengers("age_5_15_yrs")),
                          readOnly: true,
                          cursorColor: Colors.white,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            labelText: '5-15 years',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusColor: Colors.white,
                            fillColor: Colors.white,
                            suffixIcon: Icon(Icons.people_outline),
                            suffixIconColor: Colors.white,
                          ),
                          onTap: () {
                            _passengerModalBottomSheet(context,
                                title: '5-15 years',
                                passengerKey: "age_5_15_yrs");
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: deviceWidth * 0.45,
                        child: TextFormField(
                          controller: TextEditingController(
                              text: totalPasengers("students")),
                          readOnly: true,
                          cursorColor: Colors.white,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'students',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusColor: Colors.white,
                            fillColor: Colors.white,
                            suffixIcon: Icon(Icons.people_outline),
                            suffixIconColor: Colors.white,
                          ),
                          onTap: () {
                            _passengerModalBottomSheet(context,
                                title: 'Students', passengerKey: "students");
                          },
                        ),
                      ),
                      SizedBox(
                        width: deviceWidth * 0.45,
                        child: TextFormField(
                          controller: TextEditingController(
                              text: totalPasengers("below_5_yrs")),
                          readOnly: true,
                          cursorColor: Colors.white,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'below 5 years',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusColor: Colors.white,
                            fillColor: Colors.white,
                            suffixIcon: Icon(Icons.people_outline),
                            suffixIconColor: Colors.white,
                          ),
                          onTap: () {
                            _passengerModalBottomSheet(context,
                                title: 'Below 5 years',
                                passengerKey: "below_5_yrs");
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TripBookingForm(bookingData: bookingData)),
                      );
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
                          "Book Now",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     bookingDataReset();
                  //   },
                  //   child: Container(
                  //     width: deviceWidth,
                  //     height: 50,
                  //     decoration: const BoxDecoration(
                  //       borderRadius: BorderRadius.all(Radius.circular(10)),
                  //       color: Color.fromARGB(100, 0, 0, 0),
                  //     ),
                  //     child: const Center(
                  //         child: Text(
                  //       "Reset",
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.white,
                  //       ),
                  //     )),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                ],
              ),
              const Destinations(),
              const Pickups(),
            ],
          ),
        ),
      ),
    );
  }

  // Date picker bottomsheet
  void pickDateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      // barrierColor: const Color.fromARGB(54, 0, 0, 0),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Stack(children: [
            Container(
              height: 430,
            ).blurred(
                blur: 9,
                colorOpacity: 0.1,
                blurColor: const Color.fromARGB(255, 18, 48, 12)),
            Container(
              height: 430,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Center(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 370,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0)),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            'Date',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(Icons.event_outlined),
                                        ],
                                      ),
                                    ),
                                    SfDateRangePicker(
                                      todayHighlightColor:
                                          const Color(0xff3549FF),
                                      selectionColor: const Color(0xff3549FF),
                                      // showActionButtons: true,
                                      confirmText: 'OK',
                                      view: DateRangePickerView.month,
                                      selectionMode:
                                          DateRangePickerSelectionMode.single,
                                      onSelectionChanged: (date) {
                                        _onDateSelectionChanged(date);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        );
      },
    );
  }

  void _passengerModalBottomSheet(context,
      {required String title, required String passengerKey}) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    eastAfrican.text = "${bookingData['east_african'][passengerKey]}";
    nonEastAfrican.text = "${bookingData['non_east_african'][passengerKey]}";
    resident.text = "${bookingData['resident'][passengerKey]}";

    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      elevation: 0,
      backgroundColor: const Color.fromARGB(220, 0, 0, 0),
      // barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: deviceHeight * 0.6,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          textScaleFactor: 1.2,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const Icon(
                          Icons.people_outline,
                          color: Colors.white,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: eastAfrican,
                      cursorColor: Colors.white,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'East African',
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
                        helperText: '10,000',
                        helperStyle: TextStyle(color: Colors.white),
                      ),
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: nonEastAfrican,
                      cursorColor: Colors.white,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Non East African',
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
                        helperText: '40,000',
                        helperStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: resident,
                      cursorColor: Colors.white,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Resident',
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
                        helperText: '20,000',
                        helperStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        onPassengerChanged(passengerKey);
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

  void _destinationModalBottomSheet(context, {String? title}) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      elevation: 0,
      backgroundColor: const Color.fromARGB(220, 0, 0, 0),
      // barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: deviceHeight * 0.5,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Destination",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.place_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return DestinationListCard(
                          onDestinationSelected: onDestinationSelected,
                          bookingData: bookingData,
                          data: {"id": index + 1, "name": "Mbudya"},
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
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

  void _pickupModalBottomSheet(context, {String? title}) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      elevation: 0,
      backgroundColor: const Color.fromARGB(220, 0, 0, 0),
      // barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: deviceHeight * 0.5,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Pickup",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.near_me_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return PickupListCard(
                          onPickupSelected: onPickupSelected,
                          bookingData: bookingData,
                          data: {"id": index + 1, "name": "Slipway"},
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
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

  void _departureModalBottomSheet(context, {String? title}) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      elevation: 0,
      backgroundColor: const Color.fromARGB(220, 0, 0, 0),
      // barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: deviceHeight * 0.5,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Departure",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.schedule_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return DepartureCard(
                          onDepartureSelected: onDepartureSelected,
                          bookingData: bookingData,
                          data: {"id": index + 1, "name": "${9 + index}:00 am"},
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
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

  void _returnModalBottomSheet(context, {String? title}) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      elevation: 0,
      backgroundColor: const Color.fromARGB(220, 0, 0, 0),
      // barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: deviceHeight * 0.5,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Return",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.schedule_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ReturnCard(
                          onReturnSelected: onReturnSelected,
                          bookingData: bookingData,
                          data: {"id": index + 1, "name": "${3 + index}:00 pm"},
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
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
