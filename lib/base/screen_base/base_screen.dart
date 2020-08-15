
import 'package:expense_tracking/services/firebase_analytics_service.dart';
import 'package:flutter/material.dart';

import 'base_screen_state.dart';


class BaseScreen extends StatefulWidget{

  final String keyScreen;

  BaseScreen(this.keyScreen, {Key key}){
    // ignore: null_aware_in_condition
    if (keyScreen?.isNotEmpty){
      trackScreen();
    }

  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BaseScreenState();
  }

  void trackScreen(){
    FirebaseAnalyticsService.getInstance()
        .setCurrentScreen(screenName: keyScreen, screenClassOverride: keyScreen);
  }

  void showLoginScreen(BuildContext context){
//    Navigator.of(context).pushNamed(Constants.LOGIN_SCREEN);
  }


  
}