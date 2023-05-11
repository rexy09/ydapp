part of 'booking_time_bloc.dart';

@immutable
abstract class BookingTimeState {
  const BookingTimeState();
  List<Object> get props => [];
}

class BookingTimeInitial extends BookingTimeState {}

class BookingTimeLoading extends BookingTimeState {}

class BookingTimeError extends BookingTimeState {
  final String message;
  const BookingTimeError(this.message);
  @override
  List<Object> get props => [message];
}

class BookingTimeLoaded extends BookingTimeState {
  final Map<String, dynamic> bookingTime;
  const BookingTimeLoaded(this.bookingTime);
  @override
  List<Object> get props => [bookingTime];
}
