import 'package:lets_do_somethings/Api%20Response/bussiness_page_response/bussiness_sigment_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BussinessSigmnetState extends Equatable {}

class BussinessSigmnetLoadingState extends BussinessSigmnetState {
  @override
  List<Object?> get props => [];
}

class BussinessSigmnetLoadedState extends BussinessSigmnetState {
  final List<BussinessSigmentResponse> bussinessSigmentResponse;
  BussinessSigmnetLoadedState(this.bussinessSigmentResponse);
  @override
  List<Object?> get props => [bussinessSigmentResponse];
}

class BussinessSigmnetErrorState extends BussinessSigmnetState {
  final String error;
  BussinessSigmnetErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
