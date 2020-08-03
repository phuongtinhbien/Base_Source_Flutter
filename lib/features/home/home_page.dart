import 'package:expense_tracking/features/home/widgets/budget_widget.dart';
import 'package:expense_tracking/features/home/widgets/earned_widget.dart';
import 'package:expense_tracking/features/home/widgets/spent_widget.dart';
import 'package:expense_tracking/features/home/widgets/group_transaction_widget.dart';
import 'package:expense_tracking/trans/translations.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).text("activities")),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: Row(
                children: <Widget>[
                  Flexible(flex: 1, child: SpentWidget()),
                  Flexible(flex: 1, child: EarnedWidget()),
                ],
              ),
            ),
            BudgetWidget(),
            GroupTransactionWidget(),
            SizedBox(height: 16,),
            GroupTransactionWidget(),
          ],
        ),
      ),
    );
  }
}
