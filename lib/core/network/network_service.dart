import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _controller =
      StreamController<bool>.broadcast();

  Stream<bool> get connectionStream => _controller.stream;

  NetworkService() {
    _init();
  }

  void _init() async {
    // ✅ Emit initial state first
    final initial = await _connectivity.checkConnectivity();
    _controller.add(!initial.contains(ConnectivityResult.none));

    // ✅ Then listen to changes
    _connectivity.onConnectivityChanged.listen((results) {
      final hasConnection =
          !results.contains(ConnectivityResult.none);

      _controller.add(hasConnection);
    });
  }

  void dispose() {
    _controller.close();
  }
}

