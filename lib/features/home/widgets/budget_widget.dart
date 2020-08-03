import 'package:expense_tracking/themes/color_style.dart';
import 'package:expense_tracking/trans/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class BudgetWidget extends StatefulWidget {
  @override
  _BudgetWidgetState createState() => _BudgetWidgetState();
}

class _BudgetWidgetState extends State<BudgetWidget>
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
      margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: ColorStyle.white,
        boxShadow: [
          BoxShadow(
            color: ColorStyle.grey.withOpacity(0.2),
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
            Translations.of(context).text("budget_so_far"),
            style: GoogleFonts.poppins(
                fontSize: 12,
                color: ColorStyle.grey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "3.500.000 VND",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: ColorStyle.dark,
                    ),

                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "4.000.000 VND",
                    textAlign: TextAlign.end,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: ColorStyle.dark,
                    ),

                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          LinearProgressIndicator(
            backgroundColor: ColorStyle.light,
            value: 0.8,
            valueColor: ColorTween(
              begin: ColorStyle.green,
              end: ColorStyle.red,
            ).animate(
              CurvedAnimation(
                parent: controller,
                curve: Interval(
                  0.83,
                  0.83,
                  curve: Curves.linear,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}
