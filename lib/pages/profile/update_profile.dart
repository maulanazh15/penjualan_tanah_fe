import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:penjualan_tanah_fe/blocs/auth/auth_bloc.dart';
import 'package:penjualan_tanah_fe/blocs/user/user_bloc.dart';
import 'package:penjualan_tanah_fe/pages/components/avatar_profile.dart';
import 'package:image_picker_android/image_picker_android.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  static const routeName = 'update-profile';

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  
  final _formKey = GlobalKey<FormState>();
  XFile? image;
  final ImagePicker picker = ImagePicker();

  Future<void> _takePicture() async {
    image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      // You can now use the 'image' object, which contains the captured photo.
      // Update your profile picture with this image.
      setState(() {});
    }
  }

  Future<void> _pickImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // You can now use the 'image' object, which contains the selected photo.
      // Update your profile picture with this image.
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = AuthBloc().state.user;

    final TextEditingController _usernameController =
        TextEditingController(text: user?.username);
    final TextEditingController _emailController =
        TextEditingController(text: user?.email);

    void _showSuccessDialog(BuildContext context, String message) {
      showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true); // Close the dialog after 2 seconds
          });
          return AlertDialog(
            content: Text(message),
          );
        },
      );
    }

    // final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile",
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              // -- IMAGE with ICON
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: image != null ?  CircleAvatar(backgroundImage: FileImage(File(image!.path)),)  : AvatarProfile(user: user!),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black12),
                      child: IconButton(
                        icon: Icon(Icons.camera),
                        color: Colors.black,
                        iconSize: 20,
                        onPressed: () async {
                          await _pickImage();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Form Fields
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                          label: Text("User Full Name"),
                          prefixIcon: Icon(Icons.person)),
                    ),
                    const SizedBox(height: 40 - 20),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          label: Text("Email"), prefixIcon: Icon(Icons.email)),
                    ),
                    // const SizedBox(height: 40 - 20),
                    // TextFormField(
                    //   decoration: const InputDecoration(
                    //       label: Text("Phone"), prefixIcon: Icon(Icons.phone)),
                    // ),
                    // const SizedBox(height: 40 - 20),
                    // TextFormField(
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //     label: const Text("Password"),
                    //     prefixIcon: const Icon(Icons.fingerprint),
                    //     suffixIcon: IconButton(
                    //         icon: const Icon(Icons.remove_red_eye),
                    //         onPressed: () {}),
                    //   ),
                    // ),
                    const SizedBox(height: 40),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final userBloc = context.read<UserBloc>();

                          userBloc.add(UserEvent.userUpdated(
                              username: _usernameController.text,
                              email: _emailController.text,
                              profileImage: image));

                          _showSuccessDialog(context, "Update Berhasil");
                        }
                        // () => Get.to(() => const UpdateProfileScreen())
                        ,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amberAccent,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text("Update Profile",
                            style: TextStyle(color: Colors.black87)),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // -- Created Date and Delete Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            text: "Joined",
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                  text: " Joined at",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _usernameController.text = "";
                            _emailController.text = "";
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.redAccent.withOpacity(0.1),
                              elevation: 0,
                              foregroundColor: Colors.red,
                              shape: const StadiumBorder(),
                              side: BorderSide.none),
                          child: const Text("Delete"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
