import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();
  @override
  List<Object?> get props => [];
}

class NavigationInitial extends NavigationState {}

class NavigationOnPageChange extends NavigationState {
  final bool isTab1;
  final bool isTab2;
  final bool isTab3;
  final bool isTab4;
  const NavigationOnPageChange(
      this.isTab1, this.isTab2, this.isTab3, this.isTab4);
  @override
  List<Object?> get props => [isTab1, isTab2, isTab3, isTab4];
}
