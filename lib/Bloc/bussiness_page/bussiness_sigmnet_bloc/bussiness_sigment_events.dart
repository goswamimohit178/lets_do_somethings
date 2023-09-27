import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BussinessSigmentEvent extends Equatable {
  const BussinessSigmentEvent();
}

class LoadSigmentEvent extends BussinessSigmentEvent {
  @override
  List<Object?> get props => [];
}