import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnection {
  Future<bool> checkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    bool state = false;
    if (connectivityResult == ConnectivityResult.none) {
      state = false;
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      state = true;
    }
    return state;
  }
}
