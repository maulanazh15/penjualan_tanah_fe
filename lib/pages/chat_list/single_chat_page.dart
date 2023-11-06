import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:penjualan_tanah_fe/blocs/auth/auth_bloc.dart';
import 'package:penjualan_tanah_fe/models/chat_message_model.dart';
import 'package:penjualan_tanah_fe/widget/startup_container.dart';
import '../../blocs/chat/chat_bloc.dart';
import '../../models/chat_model.dart';
import '../../utils/chat.dart';
import '../../utils/laravel_echo/laravel_echo.dart';

class SingleChatPage extends StatefulWidget {
  const SingleChatPage({Key? key}) : super(key: key);

  static const routeName = 'chat';

  @override
  _SingleChatPageState createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  // List<ChatMessage> messages = basicSample;

  void listenChatChannel(ChatEntity chat) {

    LaravelEcho.instance.private('chat.${chat.id}').listen('.message.sent',
        (data) {
      final dataEncode = jsonEncode(data);
      
      _handleMessage(jsonDecode(dataEncode));
    });
  }

  void leaveChatChannel(ChatEntity chat) {
    try {
      LaravelEcho.instance.leave('chat.${chat.id}');
    } catch (e) {
      print(e);
    }
  }

  void _handleMessage(Map<String, dynamic> data) {
    final chatBloc = context.read<ChatBloc>();
    final selectedChat = chatBloc.state.selectedChat!;

    if (selectedChat.id == data['chat_id']) {
      final chatMessage = ChatMessageEntity.fromJson(data['message']);
      if(chatMessage.userId != AuthBloc().state.user?.id) {
        chatBloc.add(AddNewMessage(chatMessage));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatBloc = context.read<ChatBloc>();
    final authBloc = context.read<AuthBloc>();
    return StartUpContainer(
      onInit: () {
        // create a chat and get chat messages
        chatBloc.add(const GetChatMessage());
        if (chatBloc.state.selectedChat != null) {
          listenChatChannel(chatBloc.state.selectedChat!);
        }
      },
      onDisposed: () {
        leaveChatChannel(chatBloc.state.selectedChat!);
        chatBloc.add(const ChatReset());
        chatBloc.add(const ChatStarted());
      },
      child: Scaffold(
        appBar: AppBar(
          title: BlocConsumer<ChatBloc, ChatState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state.selectedChat != null) {
                listenChatChannel(state.selectedChat!);
              }
            },
            listenWhen: (previous, current) =>
                previous.selectedChat != current.selectedChat,
            builder: (context, state) {
              final chat = state.selectedChat;
              return Text(chat == null
                  ? 'N/A'
                  : getChatName(chat.participants, authBloc.state.user!));
            },
          ),
        ),
        body: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            return DashChat(
              currentUser: authBloc.state.user!.toChatUser,
              onSend: (ChatMessage chatMessage) {
                chatBloc.add(
                  SendMessage(
                    state.selectedChat!.id,
                    chatMessage,
                    socketId: 
                    // LaravelEcho.instance.socketId().toString(),
                    LaravelEcho.instance.socketId.toString(),
                  ),
                );
              },
              messages: state.uiChatMessages,
              messageOptions: const MessageOptions(
                showOtherUsersAvatar: true,
                showCurrentUserAvatar: false,
              ),
              messageListOptions: MessageListOptions(onLoadEarlier: () async {
                // await Future.delayed(const Duration(seconds: 3));
                // loading more message
                chatBloc.add(const LoadMoreChatMessage());
              }),
            );
          },
        ),
      ),
    );
  }
}
