import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:ydapp/screens/trip/trip_booking_form.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scrollController = ScrollController();
  String tripDate = "mm dd, yyy";
  void _onDateSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      tripDate = DateFormat('yyyy-MM-dd').format(args.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10.0),
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
                  'Start your see trip with',
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
                    hintText: 'dd-mm-yyyy',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: deviceWidth * 0.45,
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'HH:MM',
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
                      ),
                    ),
                    SizedBox(
                      width: deviceWidth * 0.45,
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'HH:MM',
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
                        readOnly: true,
                        initialValue: "0",
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
                              title: 'Above 16 years');
                        },
                      ),
                    ),
                    SizedBox(
                      width: deviceWidth * 0.45,
                      child: TextFormField(
                        readOnly: true,
                        initialValue: "0",
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
                              title: '5-15 years');
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
                        readOnly: true,
                        initialValue: "0",
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
                              title: 'Students');
                        },
                      ),
                    ),
                    SizedBox(
                      width: deviceWidth * 0.45,
                      child: TextFormField(
                        readOnly: true,
                        initialValue: "0",
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
                              title: 'Below 5 years');
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
                          builder: (context) => const TripBookingForm()),
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
    );
  }

  // Date picker bottomsheet
  void pickDateBottomSheet(BuildContext context) {
    showModalBottomSheet(
        // Changes the bottomsheet overlay colour
        barrierColor: const Color.fromARGB(54, 0, 0, 0),
        backgroundColor: Colors.transparent,
        // FOr botttom sheet to no be hidden by keyboard
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return AnimatedPadding(
            // Accessing padding for bottom sheet not be hidden by keyboard
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Stack(children: [
              Container(
                // color: Colors.blue,
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
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
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
                                          children: [
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
        });
  }
}

void _passengerModalBottomSheet(context, {required String title}) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;

  showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      elevation: 0,
      backgroundColor: const Color.fromARGB(220, 0, 0, 0),
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
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.people_outline,
                          color: Colors.white,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
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
      });
}
