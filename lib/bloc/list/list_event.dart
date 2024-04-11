import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ListEvent extends Equatable {
  const ListEvent();
  @override
  List<Object?> get props => [];
}

class GetListTop extends ListEvent {
  final int page;
  const GetListTop({required this.page});
}
class GetListPoplar extends ListEvent {
  final int page;
  const GetListPoplar({required this.page});
}
class GetListPoplarTwo extends ListEvent {
  final int page;
  const GetListPoplarTwo({required this.page});
}