part of 'base_bloc.dart';

abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object> get props => [];
}

class SuccessBaseState extends BaseState{
  final dynamic data;
  final String message;
  SuccessBaseState(this.data, {this.message});
}

class NoSuccessBaseState extends BaseState{
  final int code;
  final String message;
  NoSuccessBaseState({this.code,this.message});
}


class InitialBaseState extends BaseState {}

class ConnectionBaseState extends BaseState {}

class TimeoutBaseState extends BaseState {}

class TokenExpiredBaseState extends BaseState {}

class ErrorBaseState extends BaseState {
   String error;
   ErrorBaseState(this.error);

  @override
  List<Object> get props => [error];
}
