import 'package:expense_tracking/features/widget/transaction_widget.dart';
import 'package:expense_tracking/themes/color_style.dart';
import 'package:expense_tracking/trans/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupTransactionWidget extends StatefulWidget {
  @override
  _GroupTransactionWidgetState createState() => _GroupTransactionWidgetState();
}

class _GroupTransactionWidgetState extends State<GroupTransactionWidget>
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
      margin: EdgeInsets.only(left: 16.0, right: 16),
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
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Today",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: ColorStyle.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "3.500.000 VND",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: ColorStyle.grey,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (itemContext, index) => TransactionWidget(),
            itemCount: 4,
            shrinkWrap: true,
          )
        ],
      ),
    );
  }
}
