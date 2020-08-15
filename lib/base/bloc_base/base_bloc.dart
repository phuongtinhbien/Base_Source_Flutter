import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracking/data/network/api_provider.dart';
import 'package:meta/meta.dart';

part 'base_event.dart';

part 'base_state.dart';

class BaseBloc<T extends BaseEvent, Z extends BaseState> extends Bloc<T, Z> {

  BaseBloc(Z initialState) : super(initialState);

  ApiProvider apiProvider = ApiProvider.getInstance();

  @override
  Stream<Z> mapEventToState(T event) async* {}

  @override
  Stream<Transition<T, Z>> transformEvents(Stream<T> events, transitionFn) {
    // TODO: implement transformEvents
    return super.transformEvents(events, transitionFn);
  }


  void logErrorBase(e) {
    print("ErrorBasetState: " + e.toString());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }

  @override
  void onEvent(T event) {
    // TODO: implement onEvent
    super.onEvent(event);
  }

  BaseState mapErrorState(e) {
    logErrorBase(e);
    addError(e);
    switch (e.runtimeType) {
      case DioError:
        {
          DioError dioError = e as DioError;
          switch (dioError.type) {
            case DioErrorType.CONNECT_TIMEOUT:
            case DioErrorType.RECEIVE_TIMEOUT:
            case DioErrorType.SEND_TIMEOUT:
              {
                return TimeoutBaseState();
              }
            case DioErrorType.DEFAULT:
            case DioErrorType.RESPONSE:
            case DioErrorType.CANCEL:
              return ErrorBaseState("error_something_went_wrong");
          }
          break;
        }
      default:
        {
          return ErrorBaseState("error_something_went_wrong");
        }
    }
  }
}
