import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:penjualan_tanah_fe/blocs/auth/auth_bloc.dart';
import 'package:penjualan_tanah_fe/blocs/chat/chat_bloc.dart';
import 'package:penjualan_tanah_fe/blocs/user/user_bloc.dart';
import 'package:penjualan_tanah_fe/pages/chat_list/single_chat_page.dart';
import 'package:penjualan_tanah_fe/widget/blank_content.dart';
import 'package:search_page/search_page.dart';
import '../../models/user_model.dart';
import '../../widget/startup_container.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  static const routeName = 'chat-list';
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  
  void _showSearch(BuildContext context, List<UserEntity> users) {
    // print(users);
    showSearch(
      context: context,
      delegate: SearchPage<UserEntity>(
        items: users,
        searchLabel: 'Search people',
        suggestion: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.search,
                size: 25.0,
                color: Colors.grey,
              ),
              Text(
                'Search users by username',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        failure: const Center(
          child: Text(
            'No person found :(',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),
        filter: (user) => [
          user.username
        ],
        builder: (user) => ListTile(
          leading: const Icon(Icons.account_circle, size: 50.0),
          title: Text(user.username),
          subtitle: Text(user.email),
          onTap: () {
            // / selected user
            context.read<ChatBloc>().add(UserSelected(user));

            // / push to chat screen
            Navigator.of(context).pushNamed(SingleChatPage.routeName);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final currentUser = authBloc.state.user!;
    final chatBloc = context.read<ChatBloc>();
    final userBloc = context.read<UserBloc>();

    return StartUpContainer(
      onInit: () async {
        chatBloc.add(const ChatStarted());
        userBloc.add(const UserStarted());
      },
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              width: 400,
              height: 70,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.green, width: 2.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Chat List',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'User Id : ${currentUser.username}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  BlocSelector<UserBloc, UserState, List<UserEntity>>(
                    selector: (state) {
                      return state.map(
                        initial: (_) => [],
                        loaded: (state) => state.users,
                      );
                    },
                    builder: (context, state) {
                      print(state);
                      return IconButton(
                        onPressed: () {
                          _showSearch(context, state);
                        },
                        icon: Icon(Icons.search),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Flexible(
              child: BlocConsumer<ChatBloc, ChatState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state.chats.isEmpty) {
                    return const BlankContent(
                      content: "Chat tidak tersedia",
                      icon: Icons.chat_rounded,
                    );
                  }

                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return Text('Hello');
                    },
                    separatorBuilder: (_, __) => const Divider(
                      height: 2,
                    ),
                    itemCount: state.chats.length,
                    scrollDirection: Axis.vertical,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
