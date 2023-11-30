import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:penjualan_tanah_fe/pages/components/navigation_bar_component.dart';
import 'package:penjualan_tanah_fe/cubits/cubits.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: FlutterLogin(
        scrollable: true,
        userType: LoginUserType.name,
        hideForgotPasswordButton: true,
        logo: const AssetImage('assets/images/tanahlogo.png'),
        onLogin: cubit.signIn,
        onSignup: cubit.signUp,
        userValidator: (value) {
          if (value == '') {
            return 'Please enter username';
          }
          return null;
        },
        passwordValidator: (value) {
          if (value == null || value.length < 5) {
            return 'Password must be at least 5 chars';
          }
          return null;
        },
        loginProviders: <LoginProvider>[
          LoginProvider(
            icon: FontAwesomeIcons.google,
            label: 'Google',
            callback: () async {
              debugPrint('start google sign in');
              await Future.delayed(loginTime);
              debugPrint('stop google sign in');
              return null;
            },
          ),
          LoginProvider(
            icon: FontAwesomeIcons.facebookF,
            label: 'Facebook',
            callback: () async {
              debugPrint('start facebook sign in');
              await Future.delayed(loginTime);
              debugPrint('stop facebook sign in');
              return null;
            },
          ),
        ],
        theme: LoginTheme(
          primaryColor: Colors.green,
          accentColor: Colors.greenAccent,
          errorColor: Colors.red,
          cardTheme: const CardTheme(
            color: Colors.white,
          ),
          inputTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
          ),
          buttonTheme: const LoginButtonTheme(
            splashColor: Colors.lightGreenAccent,
            highlightColor: Colors.lightGreen,
          ),
          titleStyle: const TextStyle(
            color: Colors.white, // Set the title text color to white
          ),
        ),
        onSubmitAnimationCompleted: () {
          Navigator.of(context)
              .pushReplacementNamed(NavigationBarComponent.routeName);
        },
        onRecoverPassword: (_) => Future(() => null),
      ),
    );
  }
}
