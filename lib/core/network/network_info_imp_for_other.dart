import 'network_info.dart';

class NetworkInfoImpForOther implements NetworkInfo {
  NetworkInfoImpForOther();

  @override
  Future<bool> get isConnected async {
    return Future.value(true);
  }
}
