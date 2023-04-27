import 'package:flutter/material.dart';
import 'package:ydapp/widgets/boat_card.dart';

class Boats extends StatefulWidget {
  const Boats({super.key});

  @override
  State<Boats> createState() => _BoatsState();
}

class _BoatsState extends State<Boats> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  // Infinite Scoll listener
  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      /// reach the bottom
      // _receiptBloc.add(FetchMoreHomeReceipt());
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      /// reach the top
    }
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
                  'Start your see voyage with',
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
              height: 10,
            ),
            ListView.builder(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              itemCount: 5,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                //  if (state.hasReachedMax) {
                //   _scrollController.removeListener(_scrollListener);
                // } else {
                //   _scrollController.addListener(_scrollListener);
                // }
                // var receipt = receipts[index];
                return const BoatCard();
              },
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
