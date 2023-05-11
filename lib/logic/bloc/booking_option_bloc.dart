import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ydapp/data/repositories/booking_option_repository.dart';

part 'booking_option_event.dart';
part 'booking_option_state.dart';

class BookingOptionBloc extends Bloc<BookingOptionEvent, BookingOptionState> {
  final BookingOptionRepository bookingOptionRepository;

  BookingOptionBloc({required this.bookingOptionRepository})
      : super(BookingOptionInitial()) {
    on<FetchBookingOption>(fetchBookingOption);
  }
  Future<void> fetchBookingOption(
      FetchBookingOption event, Emitter<BookingOptionState> emit) async {
    try {
      emit(BookingOptionLoading());
      final Map<String, dynamic> bookingOptions =
          await bookingOptionRepository.fetchBookingOptions();
      if (bookingOptions.isNotEmpty) {
        emit(BookingOptionLoaded(bookingOptions));
      } else {
        emit(const BookingOptionError("Something went wrong"));
      }
    } catch (e) {
      emit(const BookingOptionError("Something went wrong"));
    }
  }

  void dispose() {}
}
