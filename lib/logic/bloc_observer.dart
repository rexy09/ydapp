import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // if (kDebugMode) {
    //   print('onEvent $event');
    // }
  }

  @override
  // ignore: avoid_renaming_method_parameters
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    // if (kDebugMode) {
    //   print('onError $error');
    // }
    super.onError(bloc, error, stacktrace);
  }

  @override
  // ignore: unnecessary_overrides
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // if (kDebugMode) {
    //   print('onChange $change');
    // }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // if (kDebugMode) {
    //   print('onTransition $transition');
    // }
    if (kDebugMode) {
      print(transition);
    }
  }
}
