import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class Websocket extends StatefulWidget {
  const Websocket({Key? key}) : super(key: key);

  static const routeName = 'websocket';

  @override
  _WebsocketState createState() => _WebsocketState();
}

class _WebsocketState extends State<Websocket> {
  final channel =
      IOWebSocketChannel.connect('ws://10.0.2.2:6001/app/websockets');

  @override
  void dispose() {
    channel.sink.close(status.goingAway);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebSocket Demo'),
      ),
      body: StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          channel.sink.add(jsonEncode({
            "event": "tes-event",
            "channel": "tes-channel",
          }));

          if (snapshot.hasData) {
            final data = snapshot.data;
            print('Received message: $data');
            return Center(
              child: Text(data),
            );
          } else if (snapshot.hasError) {
            print('Error occurred: ${snapshot.error}');
            return Center(
              child: Text('Error occurred: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: Text('Waiting for messages...'),
            );
          }
        },
      ),
    );
  }
}
