import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:ydapp/screens/boat_booking_form.dart';
import 'package:ydapp/widgets/boat_feature.dart';
import 'package:ydapp/widgets/boat_image.dart';


class BoatDetails extends StatefulWidget {
  const BoatDetails({super.key});

  @override
  State<BoatDetails> createState() => _BoatDetailsState();
}

class _BoatDetailsState extends State<BoatDetails> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://images.pexels.com/photos/570987/pexels-photo-570987.jpeg?auto=compress&cs=tinysrgb&w=1600"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: deviceHeight * 0.3,
              ),
              Container(
                constraints: BoxConstraints(minHeight: deviceHeight * 0.6),
              ).blurred(
                blur: 5,
                colorOpacity: 0.15,
                blurColor: Colors.black,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
                overlay: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mbudya',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Yachts & Dhows',
                            textScaleFactor: 1.2,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: const [
                              Text(
                                'from',
                                textScaleFactor: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '40,000 TZS',
                                textScaleFactor: 1.2,
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
                        height: 15,
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: const [
                            BoatFeature(),
                            BoatFeature(),
                            BoatFeature(),
                            BoatFeature(),
                            BoatFeature(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Comfort, sophistication and style are wrapped in one luxurious package aboard the 92ft Miami charter yacht Just For Fun. With a sleek exterior profile that turns heads along the Miami coastline, the spacious 92",
                        textScaleFactor: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: const [
                            BoatImage(),
                            BoatImage(),
                            BoatImage(),
                            BoatImage(),
                            BoatImage(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          _boatBookingFormModalBottomSheet(context);
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}

void _boatBookingFormModalBottomSheet(context) {
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
        return const BoatBookingForm();
      });
}


