import 'dart:io';

import 'package:flutter/material.dart';

import '../../models/user_model.dart';



class AvatarProfile extends StatelessWidget {
  const AvatarProfile({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
        backgroundImage: NetworkImage(
    user.urlProfileImage, 
    headers: {
    HttpHeaders.connectionHeader: 'keep-alive',
        }),
      );
  }
}