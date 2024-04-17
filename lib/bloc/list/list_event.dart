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
