import 'package:expense_tracking/themes/color_style.dart';
import 'package:expense_tracking/trans/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionWidget extends StatefulWidget {
  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget>
    with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 10000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: ColorStyle.white,
      ),
      child: Row(

        children: <Widget>[
        Container(
        width: 42.0,
        height: 42.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(21.0, 21.0)),
          gradient: LinearGradient(
            begin: Alignment(0.0, -1.0),
            end: Alignment(0.0, 1.0),
            colors: [const Color(0xff60c6bb), const Color(0xff24cac3)],
            stops: [0.0, 1.0],
          ),
        ),
      ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "House Fee",
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: ColorStyle.dark,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Condo rent monthly fee",
                    style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: ColorStyle.grey,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Text(
              "3.500.000 VND",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: ColorStyle.dark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
