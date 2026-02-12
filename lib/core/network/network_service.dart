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
    final client = HttpClient();
    final request = await client.getUrl(
      Uri.parse('https://example.com'),
    ).timeout(const Duration(seconds: 3));

    final response = await request.close();
    return response.statusCode == 200;
  } catch (_) {
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
