import 'dart:async';

import 'package:weather_app/core/network/network_service.dart';
import 'package:weather_app/core/security/weather_app_warning.dart';

class WeatherAppMonitorService {
  final NetworkService networkService;
  final StreamController<AppWarning?> _controller =
      StreamController.broadcast();

  Stream<AppWarning?> get warningStream => _controller.stream;

  WeatherAppMonitorService(this.networkService) {
    _init();
  }

  void _init() {
    networkService.connectionStream.listen((isConnected) {
      if (!isConnected) {
        _controller.add(
          AppWarning(
            type: WarningType.noInternet,
            message: "No Internet Connection",
          ),
        );
      } else {
        _controller.add(null);
      }
    });

    _checkDebugMode();
  }

  void _checkDebugMode() {
    bool isDebug = false;
    assert(() {
      isDebug = true;
      return true;
    }());

    if (isDebug) {
      _controller.add(
        AppWarning(
          type: WarningType.isRootedDevice,
          message: "App running in Debug Mode",
        ),
      );
    }
  }

  void dispose() {
    _controller.close();
  }
}
