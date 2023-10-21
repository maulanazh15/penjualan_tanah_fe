import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:penjualan_tanah_fe/blocs/blocs.dart';
import 'package:penjualan_tanah_fe/blocs/user/user_bloc.dart';
import 'package:penjualan_tanah_fe/pages/chat_list/single_chat_page.dart';
import 'package:penjualan_tanah_fe/pages/components/navigation_bar_component.dart';
import 'package:penjualan_tanah_fe/cubits/cubits.dart';
import 'package:penjualan_tanah_fe/pages/chat_list/chat_page.dart';
import 'package:penjualan_tanah_fe/pages/login/login_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:penjualan_tanah_fe/pages/splash/splash_page.dart';
import 'package:penjualan_tanah_fe/repositories/auth/auth_repository.dart';
import 'package:penjualan_tanah_fe/repositories/chat/chat_repository.dart';
import 'package:penjualan_tanah_fe/repositories/user/base_user_repository.dart';

import 'blocs/chat/chat_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (_) => AuthRepository()),
        RepositoryProvider<ChatRepository>(create: (_) => ChatRepository()),
        RepositoryProvider<UserRepository>(create: (_) => UserRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AuthBloc()),
          BlocProvider(
            create: (context) => LoginCubit(
              authRepository: context.read<AuthRepository>(),
              authBloc: context.read<AuthBloc>(),
            ),
          ),
          BlocProvider(
            create: (context) => ChatBloc(
              chatRepository: context.read<ChatRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => UserBloc(
              userRepository: context.read<UserRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Penjualan Tanah App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
            useMaterial3: true,
          ),
          initialRoute: SplashPage.routeName,
          routes: {
            LoginPage.routeName: (_) => LoginPage(),
            // ChatPage.routeName : (_) => ChatPage(),
            NavigationBarComponent.routeName: (_) =>
                const NavigationBarComponent(),
            SplashPage.routeName: (_) => const SplashPage(),
            ChatPage.routeName: (_) => const ChatPage(),
            SingleChatPage.routeName: (_) => const SingleChatPage(),
          },
        ),
      ),
    );
  }
}
