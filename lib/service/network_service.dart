import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:peli/utils/network_status.dart';

class NetworkService {
  StreamController<NetworkStatus> networkStatusController =
      StreamController<NetworkStatus>();

  NetworkService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      var networkStatus = _getStatusFromResult(result);
      networkStatusController.add(networkStatus);
    });
  }

  NetworkStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        return NetworkStatus.WiFi;
        break;
      case ConnectivityResult.mobile:
        return NetworkStatus.Cellular;
        break;
      case ConnectivityResult.none:
        return NetworkStatus.Offline;
        break;
      default:
        return NetworkStatus.Offline;
        break;
    }
  }
}
