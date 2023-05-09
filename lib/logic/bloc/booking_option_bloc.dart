import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'booking_option_event.dart';
part 'booking_option_state.dart';

class BookingOptionBloc extends Bloc<BookingOptionEvent, BookingOptionState> {
  BookingOptionBloc() : super(BookingOptionInitial()) {
    on<BookingOptionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
