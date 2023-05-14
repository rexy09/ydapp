import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ydapp/data/repositories/booking_option_repository.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingOptionRepository bookingOptionRepository;
  BookingBloc({required this.bookingOptionRepository})
      : super(BookingInitial()) {
    // on<FetchBookingTripCost>(fetchBookingTripCost);
  }

  // Future<void> fetchBookingTripCost(
  //     FetchBookingTripCost event, Emitter<BookingState> emit) async {
  //   try {
  //     emit(BookingLoading());
  //     final Map<String, dynamic> tripCost = await bookingOptionRepository
  //         .fetchBookingTripCost(bookingData: event.bookingData);
  //     if (tripCost.isNotEmpty) {
  //       emit(BookingTripCostLoaded(tripCost: tripCost));
  //     } else {
  //       emit(const BookingError("Something went wrong"));
  //     }
  //   } catch (e) {
  //     emit(const BookingError("Something went wrong"));
  //   }
  // }
}
