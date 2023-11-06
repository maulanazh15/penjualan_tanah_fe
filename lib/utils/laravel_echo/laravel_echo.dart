import 'package:laravel_echo/laravel_echo.dart';
// import 'package:laravel_echo_null/laravel_echo_null.dart';
import 'package:penjualan_tanah_fe/repositories/core/endpoints.dart';
// import 'package:pusher_client_fixed/pusher_client_fixed.dart';
import 'package:pusher_client_fixed/pusher_client_fixed.dart' as PUSHER;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:async';

class LaravelEcho {
  static LaravelEcho? _singleton;
  static late Echo _echo;
  final String token;

  LaravelEcho._({
    required this.token,
  }) {
    _echo = createLaravelEcho(token);
  }

  factory LaravelEcho.init({
    required String token,
  }) {
    if (_singleton == null || token != _singleton?.token) {
      _singleton = LaravelEcho._(token: token);
      // _echo.connector.socket.onConnect((_) => print('connected'));
    }

    return _singleton!;
  }

  static Echo get instance => _echo;

  // static Future<String> get socketId async {
  //   // _echo.connector.socket.on('connect', (_) {
  //   //   final id = _echo.connector.socket.id;
  //   //   print('connected ' + (id ?? ' null'));
  //   // });

  //   _echo.connector.onConnect((data) => print("connected " + _echo.socketId.toString()));
  //   return _echo.socketId.toString();
  // }
  static Future<String> get socketId async {
    _echo.connector.socket.on('connect', (_) {
      final id = _echo.connector.socket.id;
      print('connected ' + (id ?? ' null'));
    });

    return _echo.socketId().toString();
  }
}

class PusherConfig {
  // static const appId = "1687876";
  // static const key = "324f74abd706892cb6ea";
  // static const secret = "cdccec3873723daa7f17";
  // static const cluster = "ap1";
  // static const hostEndPoint = "https://47f4-182-2-45-233.ngrok-free.app";
  // static const hostAuthEndPoint = '$hostEndPoint/api/broadcasting/auth';
  // static const port = 6001;

  static const appId = "penjualan_tanah_websockets";
  static const key = "websockets";
  static const secret = "1234";
  static const cluster = "mt1";
  static const hostEndPoint = 'http://10.0.2.2:8000';
  static const hostAuthEndPoint = '$hostEndPoint/api/broadcasting/auth';
  static const port = 6001;
}

// PusherClient createPusherClient(String token) {
//   PusherOptions options = PusherOptions(
//     wsPort: PusherConfig.port,
//     // wssPort: PusherConfig.port,
//     // cluster: PusherConfig.cluster,
//     encrypted:
//         // true,
//         false,
//     host:
//         // PusherConfig.hostEndPoint,
//         '10.0.2.2',
//     auth: PusherAuth(
//       PusherConfig.hostAuthEndPoint,
//       headers: {
//         'Authorization': "Bearer $token",
//         "Accept": 'application/json',
//         // "Content-Type": 'application/x-www-form-urlencoded',
//       },
//     ),
//   );

//   PusherClient pusherClient = PusherClient(
//     PusherConfig.key,
//     options,
//     autoConnect: false,
//     enableLogging: true,
//   );

//   // var channel = pusherClient.subscribe('private-send-message-61-71');

//   return pusherClient;
// }

// Echo createLaravelEcho(String token) {
//   return Echo(
//     client: createPusherClient(token),
//     broadcaster: EchoBroadcasterType.Pusher,
//   );
// }

Echo createLaravelEcho(String token) {
  IO.Socket socket = IO.io(
    "http://10.0.2.2:6002",
    IO.OptionBuilder()
        .disableAutoConnect()
        .setTransports(['websocket']).build(),
  );

  return Echo(
      broadcaster: EchoBroadcasterType.SocketIO,
      client: socket,
      options: {
        'auth': {
          'headers': {
            'Authorization': "Bearer $token",
            // 'X-Socket-Id' : "1111.1111",
          }
        }
      });
}

// Echo<IO.Socket, SocketIoChannel> createLaravelEcho(String token) {
//   Echo<IO.Socket, SocketIoChannel> echo = Echo.socket(
//     'http://10.0.2.2:6002', // String: host
//     // namespace: '', // String?: namespace
//     autoConnect: true, // bool: client connection automatically
//     authHeaders: {'Authorization': 'Bearer $token'},
//     moreOptions: {
//       // Map: more io options
//       'transports': ['websocket']
//     },
//   );

//   return echo;
// }

// Echo<PUSHER.PusherClient, PusherChannel> createLaravelEcho(String token) {
//   Echo<PUSHER.PusherClient, PusherChannel> echo = Echo.pusher(
//     PusherConfig.key,
//     authEndPoint: PusherConfig.hostAuthEndPoint, // String?: auth host
//     authHeaders: {
//       // authenticate headers
//       'Authorization': 'Bearer $token',
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//     },
//     // cluster: PusherConfig.cluster, // String?: pusher cluster
//     host: '10.0.2.2',
//     wsPort: 6001,
//     encrypted: false,
//     activityTimeout: 120000,
//     pongTimeout: 30000,
//     maxReconnectionAttempts: 6,
//     maxReconnectGapInSeconds: 30,
//     enableLogging: true,
//     autoConnect: true, // bool: client connection automatically
//     nameSpace: '',
//   );

//   return echo;
// }
