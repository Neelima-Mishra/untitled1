import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/splash/splash_state.dart';

import 'splash_event.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {
      if (event is SplashStart) {
        await eventEvents(event: event, emit: emit);
      }
    });
  }

  eventEvents(
      {required SplashStart event, required Emitter<SplashState> emit}) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(const SplashLoaded(1));
  }
}
