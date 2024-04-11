import 'package:equatable/equatable.dart';

class NavigationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnPageTap extends NavigationEvent {
  final int index;
  OnPageTap(this.index);
}
