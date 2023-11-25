import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:penjualan_tanah_fe/blocs/auth/auth_bloc.dart';
import 'package:penjualan_tanah_fe/pages/components/avatar_profile.dart';
import 'package:penjualan_tanah_fe/pages/profile/update_profile.dart';
import 'package:penjualan_tanah_fe/cubits/login/login_cubit.dart';
import 'package:penjualan_tanah_fe/pages/tanah/crud_tanah_page.dart';
import '../../utils/onesignal/onesignal.dart';
import '../login/login_page.dart';
import 'profile_menu_widget.dart';

class ProfilePage extends StatefulWidget {

  const ProfilePage({Key? key}) : super(key: key);

  static const routeName = 'profile-page';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>().state;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            /// -- IMAGE
            Stack(
              children: [
                SizedBox(
                    width: 120,
                    height: 120,
                    child: AvatarProfile(user: authBloc.user!)),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Theme.of(context).primaryColor),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(authBloc.user!.username,
                style: Theme.of(context).textTheme.headlineMedium),
            Text(authBloc.user!.email,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 20),

            /// -- BUTTON
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(UpdateProfileScreen.routeName);
                }
                // () => Get.to(() => const UpdateProfileScreen())
                ,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text("Edit Profile",
                    style: TextStyle(color: Colors.black87)),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            /// -- MENU
            // ProfileMenuWidget(
            //     title: "Settings", icon: Icons.settings, onPress: () {}),
            // ProfileMenuWidget(
            //     title: "Billing Details", icon: Icons.wallet, onPress: () {}),
            ProfileMenuWidget(
                title: "Tanah Anda",
                icon: Icons.people,
                onPress: () {
                  Navigator.of(context).pushNamed(CrudLandPage.routeName);
                }),
            const Divider(),
            const SizedBox(height: 10),
            ProfileMenuWidget(
                title: "Information", icon: Icons.info, onPress: () {}),
            ProfileMenuWidget(
                title: "Logout",
                icon: Icons.arrow_back,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: Text("LOGOUT"),
                          titleTextStyle: const TextStyle(fontSize: 20),
                          content: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Text("Are you sure, you want to Logout?"),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                final authBloc = context.read<AuthBloc>().state;

                                if (authBloc.isAuthenticated) {
                                  context.read<LoginCubit>().signOut();
                                  deleteUserTag();
                                  Navigator.of(context).pushReplacementNamed(
                                      LoginPage.routeName);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  side: BorderSide.none),
                              child: const Text("Yes"),
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("No")),
                          ]);
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
