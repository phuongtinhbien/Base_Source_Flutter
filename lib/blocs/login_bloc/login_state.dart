part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class GoogleLoginSuccess extends LoginState {
  final FirebaseUser user;

  GoogleLoginSuccess(this.user);
}

class GoogleLoginFail extends LoginState {}

class FacebookLoginSuccess extends LoginState {}

class FacebookLoginFail extends LoginState {}

class SignOutEventSuccess extends LoginState {}

class SignOutEventFail extends LoginState {}

class GetCurrentUserEventSuccess extends LoginState {
  final FirebaseUser user;

  GetCurrentUserEventSuccess(this.user);

}

class GetCurrentUserEventFail extends LoginState {}
