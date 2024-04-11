import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/request/request.dart';
import '../../domain/usecase/list_usecase.dart';
import 'list_event.dart';
import 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListUseCase listUseCase;
  ListBloc({required this.listUseCase}) : super(ListInitial()) {
    on<ListEvent>((event, emit) async {
      if (event is GetListTop) {
        await eventEvents(event: event, emit: emit);
      }
      if (event is GetListPoplar) {
        await eventEventsPopular(event: event, emit: emit);
      }
      if (event is GetListPoplarTwo) {
        await eventEventsPopularTwo(event: event, emit: emit);
      }
    });
  }

  eventEvents(
      {required GetListTop event, required Emitter<ListState> emit}) async {
    emit(ListLoading());
    final response = await listUseCase.execute(TopRequest(page: event.page));
    response.fold((failure) {
      emit(ListEmpty());
    }, (success) {
      emit(ListLoaded(success));
    });
  }

  eventEventsPopular(
      {required GetListPoplar event, required Emitter<ListState> emit}) async {
    emit(ListLoadingPopular());
    final response = await listUseCase.execute(TopRequest(page: event.page));
    response.fold((failure) {
      emit(ListEmpty());
    }, (success) {
      emit(ListLoadedPopular(success));
    });
  }
  eventEventsPopularTwo(
      {required GetListPoplarTwo event, required Emitter<ListState> emit}) async {
    emit(ListLoadingPopularTWo());
    final response = await listUseCase.execute(TopRequest(page: event.page));
    response.fold((failure) {
      emit(ListEmpty());
    }, (success) {
      emit(ListLoadedPopularTwo(success));
    });
  }
}
