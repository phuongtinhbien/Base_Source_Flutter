import 'package:expense_tracking/themes/color_style.dart';
import 'package:expense_tracking/trans/translations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EarnedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          begin: Alignment(-0.66, -0.64),
          end: Alignment(1.0, 1.0),
          colors: [Color(0xff38CD96),Color(0xff6BE793)],
          stops: [0.0, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff38CD96).withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            Translations.of(context).text("earned"),
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: ColorStyle.white,
            ),

          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:4.0),
            child: Text(
              "VND -100,000",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: ColorStyle.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            Translations.of(context).text("incomes") + " this month",
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: ColorStyle.white,
            ),

          ),
        ],
      ),
    );
  }
}
