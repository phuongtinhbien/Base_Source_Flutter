import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/foundation.dart';

class ConnectivityService extends ChangeNotifier {

  DataConnectionStatus status;

  ConnectivityService()  {
   initStatus();
    DataConnectionChecker().onStatusChange.listen((s) {
      switch (s) {
        case DataConnectionStatus.connected:
          status = DataConnectionStatus.connected;
          notifyListeners();
          break;
        case DataConnectionStatus.disconnected:
          status = DataConnectionStatus.disconnected;
          notifyListeners();
          break;
      }
    });
  }
  initStatus ()async {
    status = await DataConnectionChecker().connectionStatus;
  }

}