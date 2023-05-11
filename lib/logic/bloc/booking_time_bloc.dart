import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ydapp/data/repositories/booking_option_repository.dart';

part 'booking_time_event.dart';
part 'booking_time_state.dart';

class BookingTimeBloc extends Bloc<BookingTimeEvent, BookingTimeState> {
  final BookingOptionRepository bookingOptionRepository;

  BookingTimeBloc({required this.bookingOptionRepository})
      : super(BookingTimeInitial()) {
    on<FetchBookingTime>(fetchBookingTime);
  }
  Future<void> fetchBookingTime(
      FetchBookingTime event, Emitter<BookingTimeState> emit) async {
    try {
      emit(BookingTimeLoading());
      final Map<String, dynamic> bookingTime =
          await bookingOptionRepository.fetchBookingTime(destination:event.destination, date:event.date);
      if (bookingTime.isNotEmpty) {
        emit(BookingTimeLoaded(bookingTime));
      } else {
        emit(const BookingTimeError("Something went wrong"));
      }
    } catch (e) {
      emit(const BookingTimeError("Something went wrong"));
    }
  }

  void dispose() {}
}
