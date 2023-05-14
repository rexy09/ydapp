part of 'booking_option_bloc.dart';

@immutable
abstract class BookingOptionEvent {
  const BookingOptionEvent();
   @override
  List<Object> get props => [];
}

class FetchBookingOption extends BookingOptionEvent {}

class FetchBookingTripCost extends BookingOptionEvent {
  final Map<String, dynamic> bookingData;
  const FetchBookingTripCost({required this.bookingData});

  @override
  List<Object> get props => [bookingData];
}
