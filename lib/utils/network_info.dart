import 'package:connectivity/connectivity.dart';

abstract class InternetConnection {
  Future<bool> get isConnected;
}

class NetworkInfo implements InternetConnection {
  @override
  Future<bool> get isConnected =>
      Connectivity().checkConnectivity().then((connectivityResult) {
        if (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi) {
          return true;
        }
        return false;
      });
}