import 'package:ydapp/data/data_providers/booking_option_data_provider.dart';

class BookingOptionRepository {
  final BookingOptionDataProvider bookingOptionDataProvider =
      BookingOptionDataProvider();

  Future<Map<String, dynamic>> fetchBookingOptions() async {
    return await bookingOptionDataProvider.fetchBookingOptions();
  }

  Future<Map<String, dynamic>> fetchBookingTime(
      {required int destination, required String date}) async {
    return await bookingOptionDataProvider.fetchBookingTime(
        destination: destination, date: date);
  }
}
