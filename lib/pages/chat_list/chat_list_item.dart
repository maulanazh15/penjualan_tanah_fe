
import 'package:flutter/material.dart';

import '../../models/chat_model.dart';
import '../../models/user_model.dart';
import '../../utils/chat.dart';
import '../../utils/formatting.dart';
import '../components/avatar_profile.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({
    Key? key,
    required this.item,
    required this.currentUser,
    required this.onPressed,
  }) : super(key: key);

  final ChatEntity item;
  final UserEntity currentUser;
  final void Function(ChatEntity) onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          // const Icon(Icons.account_circle, size: 50.0),
          AvatarProfile(user: getOtherUser(item.participants, currentUser)),
          // Image.network(currentUser.urlProfileImage),
      title: Text(
        item.name ??
            getChatName(
              item.participants,
              currentUser,
            ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              item.lastMessage?.message ?? "...",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Text(utcToLocal(item.updatedAt)),
        ],
      ),
      onTap: () => onPressed(item),
    );
  }
}


