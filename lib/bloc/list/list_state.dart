import 'package:equatable/equatable.dart';

import '../../domain/models/list_model.dart';

abstract class ListState extends Equatable {
  const ListState();
  @override
  List<Object?> get props => [];
}

class ListInitial extends ListState {}

class ListLoading extends ListState {}

class ListLoaded extends ListState {
  final ProfileData list;
  const ListLoaded(this.list);
  @override
  List<Object?> get props => [list];
}

class ListError extends ListState {
  final String? message;
  const ListError(this.message);
  @override
  List<Object?> get props => [message];
}

class ListLoadingPopular extends ListState {}

class ListLoadedPopular extends ListState {
  final ProfileData list;
  const ListLoadedPopular(this.list);
  @override
  List<Object?> get props => [list];
}

class ListErrorPopular extends ListState {
  final String? message;
  const ListErrorPopular(this.message);
  @override
  List<Object?> get props => [message];
}
class ListLoadingPopularTWo extends ListState {}

class ListLoadedPopularTwo extends ListState {
  final ProfileData list;
  const ListLoadedPopularTwo(this.list);
  @override
  List<Object?> get props => [list];
}

class ListErrorPopularTwo extends ListState {
  final String? message;
  const ListErrorPopularTwo(this.message);
  @override
  List<Object?> get props => [message];
}

class ListEmpty extends ListState {}

class ListNoInternet extends ListState {}
