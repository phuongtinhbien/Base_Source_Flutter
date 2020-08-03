part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class GoogleLoginEvent extends LoginEvent {}

class FacebookLoginEvent extends LoginEvent {}

class SignOutEvent extends LoginEvent {}

class GetCurrentUserEvent extends LoginEvent{}
