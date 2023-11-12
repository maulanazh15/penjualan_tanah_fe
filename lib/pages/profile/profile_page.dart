import 'package:flutter/material.dart';
import 'package:penjualan_tanah_fe/blocs/auth/auth_bloc.dart';
import 'package:penjualan_tanah_fe/pages/components/avatar_profile.dart';
import 'package:penjualan_tanah_fe/pages/profile/update_profile.dart';

import 'profile_menu_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final authBloc = AuthBloc().state;
  @override
  Widget build(BuildContext context) {
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
                        color: Colors.amberAccent),
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
                    backgroundColor: Colors.amberAccent,
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
            ProfileMenuWidget(
                title: "Settings", icon: Icons.settings, onPress: () {}),
            ProfileMenuWidget(
                title: "Billing Details", icon: Icons.wallet, onPress: () {}),
            ProfileMenuWidget(
                title: "User Management", icon: Icons.people, onPress: () {}),
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
                  AlertDialog(
                      title: Text("LOGOUT"),
                      titleTextStyle: const TextStyle(fontSize: 20),
                      content: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Are you sure, you want to Logout?"),
                      ),
                      actions: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {}
                            // () => AuthenticationRepository.instance.logout()
                            ,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                side: BorderSide.none),
                            child: const Text("Yes"),
                          ),
                        ),
                        OutlinedButton(
                            onPressed: () {}
                            // () => Get.back()
                            ,
                            child: const Text("No")),
                      ]);
                }),
          ],
        ),
      ),
    );
  }
}
