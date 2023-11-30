import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:penjualan_tanah_fe/blocs/auth/auth_bloc.dart';
import 'package:penjualan_tanah_fe/pages/components/avatar_profile.dart';
import 'package:penjualan_tanah_fe/pages/home/home_page.dart';
import 'package:penjualan_tanah_fe/pages/profile/profile_page.dart';
import 'package:search_page/search_page.dart';

import '../../blocs/chat/chat_bloc.dart';
import '../../blocs/user/user_bloc.dart';
import '../../models/user_model.dart';
import '../../utils/laravel_echo/laravel_echo.dart';
import '../chat_list/chat_page.dart';
import '../chat_list/single_chat_page.dart';

// ignore: must_be_immutable
class NavigationBarComponent extends StatefulWidget {
  int? selectedIndex;
  NavigationBarComponent({Key? key, this.selectedIndex}) : super(key: key);

  static const routeName = 'navigation-bar';

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarComponent> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.selectedIndex = null;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final authBloc = context.read<AuthBloc>();
    LaravelEcho.init(token: authBloc.state.token!);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.selectedIndex = null;
    super.dispose();
  }

  void _showSearch(BuildContext context, List<UserEntity> users) {
    // print(users);

    showSearch(
      context: context,
      delegate: SearchPage<UserEntity>(
        items: users,
        searchLabel: 'Search people',
        suggestion: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
        filter: (user) => [user.username],
        builder: (user) => ListTile(
          leading:
              // const Icon(Icons.account_circle, size: 50.0),
              AvatarProfile(key: ValueKey(user.id), user: user),
          // Image.network(user.urlProfileImage,
          // headers:
          // const {
          //   HttpHeaders.connectionHeader: 'keep-alive',
          // },),
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

  // Define a list of screens or pages that correspond to the menu items.
  final List<Widget> _screens = [
    // Replace these with your actual screen widgets.
    const HomePage(
      key: Key('Home'),
    ),
    // const SerachPage(
    //   key: Key('Search'),
    // ),
    const ChatPage(
      key: Key('Chat'),
    ),
    const ProfilePage(
      key: Key('Profile'),
    ),
  ];
  // final authState = AuthBloc().state;
  @override
  Widget build(BuildContext context) {
    // final authState = context.read<AuthBloc>().state;
    _selectedIndex = (widget.selectedIndex ?? _selectedIndex);
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            _screens[_selectedIndex].key.toString().replaceAllMapped(
                  RegExp(r"\[<'?([^']+)'?>\]"),
                  (match) =>
                      match.group(1) ??
                      "", // Replace with an empty string if the match is null
                ),
          ),
        ),
        actions: [
          _screens[_selectedIndex].key == const Key('Chat')
              ? BlocSelector<UserBloc, UserState, List<UserEntity>>(
                  selector: (state) {
                    return state.map(
                      initial: (_) => [],
                      loaded: (state) => state.users,
                    );
                  },
                  builder: (context, state) {
                    // ;
                    return IconButton(
                      onPressed: () {
                        _showSearch(context, state);
                      },
                      icon: const Icon(Icons.search),
                    );
                  },
                )
              : const Text('')
        ],
        backgroundColor: Colors.green,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.search),
          //   label: 'Search',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:
            Theme.of(context).primaryColor, // Change the selected item color
        unselectedItemColor: Colors.grey, // Change the unselected item color
        onTap: _onItemTapped,
      ),
    );
  }
}
