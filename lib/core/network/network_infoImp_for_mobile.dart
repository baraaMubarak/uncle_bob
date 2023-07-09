import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'network_info.dart';

class NetworkInfoImpForMobile implements NetworkInfo {
  NetworkInfoImpForMobile();

  @override
  Future<bool> get isConnected async {
    return await InternetConnectionChecker().hasConnection;
  }
}
