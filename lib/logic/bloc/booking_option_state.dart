part of 'booking_option_bloc.dart';

@immutable
abstract class BookingOptionState {
   const BookingOptionState();
  List<Object> get props => [];
}

class BookingOptionInitial extends BookingOptionState {}

class BookingOptionLoading extends BookingOptionState {}
class BookingOptionError extends BookingOptionState {
  final String message;
  const BookingOptionError(this.message);
   @override
  List<Object> get props => [message];
} 

class BookingOptionLoaded extends BookingOptionState {
  final Map<String,dynamic> bookingOptions;
  const BookingOptionLoaded(this.bookingOptions);
   @override
  List<Object> get props => [bookingOptions];
}
class BookingTripCostLoaded extends BookingOptionState {
  final Map<String, dynamic> tripCost;
  const BookingTripCostLoaded({required this.tripCost});
  @override
  List<Object> get props => [tripCost];
}
