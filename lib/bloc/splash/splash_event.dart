import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class SplashEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SplashStart extends SplashEvent {}
