import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();
  @override
  List<Object?> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoaded extends SplashState {
  final int identity;
  const SplashLoaded(this.identity);
  @override
  List<Object?> get props => [identity];
}
