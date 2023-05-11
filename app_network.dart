import 'package:connectivity_plus/connectivity_plus.dart';

abstract interface class AppNetwork {
  Future<bool> get isConnected;
  Stream<bool> get onConnectivityChanged;
}

class AppNetworkImpl implements AppNetwork {
  @override
  Future<bool> get isConnected async {
    final result = await Connectivity().checkConnectivity();
    return result.isConnected;
  }

  Stream<bool>? _connectivityStream;

  @override
  Stream<bool> get onConnectivityChanged {
    return _connectivityStream ??= Connectivity().onConnectivityChanged.map(
          (result) => result.isConnected,
        );
  }
}

extension on ConnectivityResult {
  bool get isConnected {
    return this == ConnectivityResult.wifi ||
        this == ConnectivityResult.mobile ||
        this == ConnectivityResult.ethernet;
  }
}
