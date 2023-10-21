import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:penjualan_tanah_fe/widget/startup_container.dart';
import '../../blocs/chat/chat_bloc.dart';
import './data.dart';

class SingleChatPage extends StatefulWidget {
  const SingleChatPage({Key? key}) : super(key: key);

  static const routeName = 'chat';

  @override
  _SingleChatPageState createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  List<ChatMessage> messages = basicSample;

  @override
  Widget build(BuildContext context) {
    return StartUpContainer(
      onInit: () {
        
      },
      child: Scaffold(
        appBar: AppBar(
          title: BlocConsumer<ChatBloc, ChatState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              final chat = state.selectedChat;
              print(chat);
              return Text('Other User Name');
            },
          ),
        ),
        body: DashChat(
          currentUser: user,
          onSend: (ChatMessage message) {
            print("Buat Pesan chat");
          },
          messages: messages,
          messageListOptions: MessageListOptions(onLoadEarlier: () async {
            await Future.delayed(const Duration(seconds: 3));
            // loadi more message
          }),
        ),
      ),
    );
  }
}
