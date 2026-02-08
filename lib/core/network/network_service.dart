import 'dart:async';
import 'dart:io';

class NetworkService {
  final StreamController<bool> _controller = StreamController.broadcast();

  Stream<bool> get connectionStream => _controller.stream;

  bool _lateStatus = true;

  NetworkService() {
    _startMonitoring();
  }

  Future<bool> hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  void _startMonitoring() {
    Timer.periodic(const Duration(seconds: 3), (timer) async {
      final status = await hasInternet();

      if (status != _lateStatus) {
        _lateStatus = status;
        _controller.add(status);
      }
    });
  }

  void dispose() {
    _controller.close();
  }
}
