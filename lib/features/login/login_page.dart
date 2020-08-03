import 'package:expense_tracking/blocs/login_bloc/login_bloc.dart';
import 'package:expense_tracking/res.dart';
import 'package:expense_tracking/themes/color_style.dart';
import 'package:expense_tracking/trans/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc  = new LoginBloc();

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
            SvgPicture.asset(Res.app_icon_vector),
            SizedBox(
              height: 16,
            ),
            Text(
              Translations.of(context).text("welcome_to"),
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: ColorStyle.dark,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Translations.of(context).text("sign_in_to_continue"),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: ColorStyle.grey,
                ),
              ),
            ),
            SizedBox(height: 40,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: FlatButton.icon(
                  onPressed: onLoginWithGoogle,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    side: BorderSide(
                      color: ColorStyle.light,
                      width: 1.0
                    )
                  ),
                  icon: SvgPicture.asset(Res.Google),
                  padding: EdgeInsets.all(16.0),

                  label: Expanded(
                    child: Text(Translations.of(context).text("login_with_google"),
                      style: GoogleFonts.poppins(
                        color: ColorStyle.grey, fontSize: 14.0,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: FlatButton.icon(
                  onPressed: onLoginWithFacebook,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      side: BorderSide(
                          color: ColorStyle.light,
                          width: 1.0
                      )
                  ),
                  icon: SvgPicture.asset(Res.Facebook),
                  padding: EdgeInsets.all(16.0),
                  label: Expanded(
                    child: Text(Translations.of(context).text("login_with_facebook"),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: ColorStyle.grey, fontSize: 14.0,
                          fontWeight: FontWeight.bold
                      ),),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void onLoginWithGoogle(){
    _loginBloc.add(GoogleLoginEvent());
    _loginBloc.listen((state){
      if (state is GoogleLoginSuccess){
        Navigator.popUntil(context, ModalRoute.withName("/"));
      }
    });

  }
  void onLoginWithFacebook(){

  }

}
