import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:penjualan_tanah_fe/blocs/auth/auth_bloc.dart';
import 'package:penjualan_tanah_fe/cubits/login/login_cubit.dart';
import 'package:penjualan_tanah_fe/pages/home_page.dart';
import 'package:penjualan_tanah_fe/pages/login/login_page.dart';
import 'package:penjualan_tanah_fe/pages/profile_page.dart';
import 'package:penjualan_tanah_fe/pages/serach_page.dart';

import '../chat_list/chat_page.dart';

class NavigationBarComponent extends StatefulWidget {
  const NavigationBarComponent({Key? key}) : super(key: key);

  static const routeName = 'navigation-bar';

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarComponent> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      ;
    });
  }

  // Define a list of screens or pages that correspond to the menu items.
  final List<Widget> _screens = [
    // Replace these with your actual screen widgets.
    HomePage(),
    SerachPage(),
    ChatPage(),
    ProfilePage(),
  ];
  // final authState = AuthBloc().state;
  @override
  Widget build(BuildContext context) {
    // final authState = context.read<AuthBloc>().state;
    // ;
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
            // TODO: implement listener
            // ;
            if (!state.isAuthenticated) {
              Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
            }
          }, builder: (context, state) {
            if (state.isAuthenticated) {
              return IconButton(
                  onPressed: () {
                    // ;
                    context.read<LoginCubit>().signOut();
                  },
                  icon: const Icon(Icons.logout));
            }

            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.people),
            );
          })
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
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
        selectedItemColor: Colors.deepOrange, // Change the selected item color
        unselectedItemColor: Colors.grey, // Change the unselected item color
        onTap: _onItemTapped,
      ),
    );
  }
}
