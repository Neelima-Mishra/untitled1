import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigationEvent>((event, emit) async {
      if (event is OnPageTap) {
        await eventEvents(event: event, emit: emit);
      }
    });
  }

  eventEvents(
      {required OnPageTap event,
      required Emitter<NavigationState> emit}) async {
    emit(NavigationOnPageChange(event.index == 0, event.index == 1,
        event.index == 2, event.index == 3));
  }
}
