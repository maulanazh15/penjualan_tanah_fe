import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:penjualan_tanah_fe/blocs/auth/auth_bloc.dart';
import 'package:penjualan_tanah_fe/pages/components/navigation_bar_component.dart';
import 'package:penjualan_tanah_fe/pages/login/login_page.dart';
import 'package:penjualan_tanah_fe/widget/blank_content.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const routeName = 'splash-page';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _isInit = false;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _initialize();
    super.didChangeDependencies();
  }

  void _initialize() async {
    if (!_isInit) {
      await Future.delayed(const Duration(milliseconds: 500));
    }
    if (!mounted) return;

    final authState = context.read<AuthBloc>().state;
    ;
    final redirectPage = authState.isAuthenticated
        ? NavigationBarComponent.routeName
        : LoginPage.routeName;

    Navigator.of(context).pushReplacementNamed(redirectPage);
    _isInit = true;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BlankContent(
        isLoading: true,
      ),
    );
  }
}
