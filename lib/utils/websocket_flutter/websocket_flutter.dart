import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketManager {
  static late WebSocketManager  _instance;
  late WebSocketChannel _channel;

  // Private constructor to ensure a singleton pattern
  WebSocketManager._();

  static WebSocketManager get instance {
    return _instance;
  }

  void connect(String url) {
    _channel = IOWebSocketChannel.connect(url);
  }

  void disconnect() {
    _channel.sink.close();
  }

  void listen(void Function(dynamic) onData,
      {required void Function(dynamic) onError, required void Function() onDone}) {
    _channel.stream.listen(
      onData,
      onError: onError,
      onDone: onDone,
    );
  }
}
