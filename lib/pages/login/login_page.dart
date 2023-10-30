import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:penjualan_tanah_fe/pages/components/navigation_bar_component.dart';
import 'package:penjualan_tanah_fe/cubits/cubits.dart';

class LoginPage extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  static const routeName = 'login';


  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return FlutterLogin(
      title: 'Land Market App',
      scrollable: true,
      userType: LoginUserType.name,
      hideForgotPasswordButton: true,
      logo: AssetImage('assets/images/chat.png'),
      onLogin: cubit.signIn,
      onSignup: cubit.signUp,
      userValidator: (value) {
        if (value == '' ) {
          return 'Please enter username';
        }
      },
      passwordValidator: (value) {
        if (value == null || value.length < 5) {
          return 'Password must be at least 5 chars';
        }
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
        LoginProvider(
          icon: FontAwesomeIcons.linkedinIn,
          callback: () async {
            debugPrint('start linkdin sign in');
            await Future.delayed(loginTime);
            debugPrint('stop linkdin sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.githubAlt,
          callback: () async {
            debugPrint('start github sign in');
            await Future.delayed(loginTime);
            debugPrint('stop github sign in');
            return null;
          },
        ),
      ],
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacementNamed(NavigationBarComponent.routeName);
      },
      onRecoverPassword: (_) => Future(() => null),
    );
  }
}
