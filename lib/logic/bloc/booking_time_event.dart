part of 'booking_time_bloc.dart';

@immutable
abstract class BookingTimeEvent {
  const BookingTimeEvent();
  List<Object> get props => [];
}

class FetchBookingTime extends BookingTimeEvent {
  final int destination;
  final String date;
  const FetchBookingTime({required this.destination, required this.date});

  @override
  List<Object> get props => [destination, date];
}
