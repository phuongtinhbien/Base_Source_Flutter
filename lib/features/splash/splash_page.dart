import 'package:expense_tracking/blocs/login_bloc/login_bloc.dart';
import 'package:expense_tracking/res.dart';
import 'package:expense_tracking/themes/color_style.dart';
import 'package:expense_tracking/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';

class SplashPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashPageState();
  }
  
}
class SplashPageState extends State<SplashPage>{
  LoginBloc _loginBloc = new LoginBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadingData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: ColorStyle.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: SvgPicture.asset(Res.app_icon_vector)),
            SizedBox(
              height: 40,
            ),
            Loading(color: ColorStyle.grey, size: 20, indicator: BallSpinFadeLoaderIndicator(),),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }


  void loadingData(){
    _loginBloc.add(GetCurrentUserEvent());
    _loginBloc.listen((state) {
      if (state is GetCurrentUserEventSuccess){
        Navigator.of(context).popUntil(ModalRoute.withName("/"));
      } else {
        Navigator.of(context).popAndPushNamed(LOGIN_SCREEN);
      }
    });
  }

  
}