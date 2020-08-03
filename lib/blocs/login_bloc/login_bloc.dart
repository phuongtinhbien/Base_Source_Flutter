import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GoogleLoginEvent) {
      yield LoginInitial();
      yield await _processGoogleLogin(event);
    } else if (event is FacebookLoginEvent) {
      yield LoginInitial();
      yield await _processFacebookLogin(event);
    } else if (event is SignOutEvent) {
      yield LoginInitial();
      yield await _processSignOut(event);
    } else if (event is GetCurrentUserEvent) {
      yield await _processGetCurrentUser(event);
    }
  }

  _processGoogleLogin(GoogleLoginEvent event) async {
    try {
      GoogleSignIn _googleSignIn = new GoogleSignIn();
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;

      return GoogleLoginSuccess(user);
    } catch (e) {
      print(e.toString());
      return GoogleLoginFail();
    }
  }

  _processFacebookLogin(FacebookLoginEvent event) async {}

  _processSignOut(SignOutEvent event) async {
    try {
      await _auth.signOut();
      return SignOutEventSuccess();
    } catch (e) {
      return SignOutEventFail();
    }
  }

  _processGetCurrentUser(GetCurrentUserEvent event) async {
    try {
      FirebaseUser currentUser = await _auth.currentUser();
      if (currentUser != null) {
        return GetCurrentUserEventSuccess(currentUser);
      } else {
        return GetCurrentUserEventFail();
      }
    } catch (e) {
      return GetCurrentUserEventFail();
    }
  }
}
