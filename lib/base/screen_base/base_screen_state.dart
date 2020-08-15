
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:expense_tracking/base/screen_base/base_screen.dart';
import 'package:expense_tracking/services/connectivity_service.dart';
import 'package:expense_tracking/services/firebase_analytics_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BaseScreenState<T extends BaseScreen> extends State<T>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  bool networkConnectionStatus() =>
      Provider.of<ConnectivityService>(context, listen: false).status !=
      DataConnectionStatus.disconnected;

  void showRegisterScreen(){
//    Navigator.of(context).pushNamed(Constants.REGISTER_SCREEN);
  }

  void trackEvent({String event, Map<String, dynamic> parameters}) {
    if (parameters == null) {
      parameters = new Map();
    }
    FirebaseAnalyticsService.getInstance()
        .analytics
        .logEvent(name: event, parameters: parameters);
  }
  
  void showSortType(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder) =>
          Wrap(
            children: <Widget>[
              Container(
                height: 300,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context,index){
                    return Container(
                      height: 50,
                      color: Colors.white,
                      padding: EdgeInsets.all(15),
                      child: Text("New Products"),
                    );
                  },
                ),
              ),
            ],
          ),

    );
  }

}
