import 'package:flutter/foundation.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ydapp/data/common/base_url.dart';

class BookingOptionDataProvider {
  final _baseUrl = BaseUrl.baseUrl;
  // final storage = const FlutterSecureStorage();
  final successCode = 200;

  Future<Map<String, dynamic>> fetchBookingOptions() async {
    var url = Uri.parse("$_baseUrl/booking/options");
    final response = await http.get(
      url,
      headers: {},
    );
    if (response.statusCode == successCode) {
      final json = jsonDecode(response.body);
      Map<String, dynamic> report = json;
      return report;
    } else {
      throw response.statusCode;
    }
  }

  Future<Map<String, dynamic>> fetchBookingTime(
      {required int destination, required String date}) async {
    var url =
        Uri.parse("$_baseUrl/booking/time?destination=$destination&date=$date");
    final response = await http.get(
      url,
      headers: {},
    );
    if (response.statusCode == successCode) {
      final json = jsonDecode(response.body);
      Map<String, dynamic> report = json;
      return report;
    } else {
      throw response.statusCode;
    }
  }

  Future<Map<String, dynamic>> fetchBookingTripCost(
      {required Map<String, dynamic> bookingData}) async {
    var url = Uri.parse("$_baseUrl/booking/trip/cost/calculator");
    final response = await http.post(url,
        headers: {
          "content-type": "application/json",
        },
        body: jsonEncode(bookingData));
    if (response.statusCode == successCode) {
      final json = jsonDecode(response.body);
      Map<String, dynamic> report = json;
      return report;
    } else {
      throw response.statusCode;
    }
  }
}
