part of 'base_bloc.dart';

@immutable
abstract class BaseEvent extends Equatable {
  const BaseEvent();

  @override
  List<Object> get props => [];
}
