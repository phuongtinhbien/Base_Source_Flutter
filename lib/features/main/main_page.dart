import 'package:expense_tracking/features/debt/debt_page.dart';
import 'package:expense_tracking/features/home/home_page.dart';
import 'package:expense_tracking/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }
  
}
class MainPageState extends State<MainPage>{
  int _selected;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selected = 0;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: IndexedStack(
        index: _selected,
        children: <Widget>[HomePage(), DebtPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected,
        onTap: (index) {
          setState(() {
            _selected = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _selected == 0?SvgPicture.asset(Res.transaction, width: 15, height: 15,):SvgPicture.asset(Res.transaction_unselected , width: 15, height: 15,),
            ),
            title: Text("History", style: GoogleFonts.poppins(fontWeight: _selected == 0?FontWeight.w500: FontWeight.normal),)
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _selected == 1?SvgPicture.asset(Res.debt,  width: 15, height: 15,):SvgPicture.asset(Res.debt_unselected,  width: 15, height: 15,),
            ),
            title: Text("Nợ",style: GoogleFonts.poppins(fontWeight: _selected == 1?FontWeight.w500: FontWeight.normal))
          )
        ],
      ),
    );
  }
  
}