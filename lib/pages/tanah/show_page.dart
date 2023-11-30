import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:penjualan_tanah_fe/blocs/auth/auth_bloc.dart';
import 'package:penjualan_tanah_fe/models/land_model.dart';
import 'package:penjualan_tanah_fe/models/models.dart';
import 'package:penjualan_tanah_fe/pages/tanah/edit_page.dart';
import 'package:penjualan_tanah_fe/repositories/location/location_repository.dart';
import 'package:penjualan_tanah_fe/repositories/user/base_user_repository.dart';
import 'package:penjualan_tanah_fe/utils/logger.dart';
import 'package:penjualan_tanah_fe/utils/utils.dart';

import '../../blocs/chat/chat_bloc.dart';
import '../../models/location_model.dart';
import '../chat_list/single_chat_page.dart';

class ShowPage extends StatefulWidget {
  final LandModel landModel;
  final bool isCrudPage;
  const ShowPage({Key? key, required this.landModel, required this.isCrudPage})
      : super(key: key);

  static const routeName = 'show-page-tanah';
  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  LocationData? locationData;
  String? desa, kecamatan, kabupaten, provinsi;
  UserEntity? landUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocationRepository()
        .fetchDataLocation(widget.landModel.subDisId!)
        .then((value) {
      if (mounted) {
        setState(() {
          locationData = value;
          desa = capitalizeEachWord(locationData!.subDistrictName);
          kecamatan = capitalizeEachWord(locationData!.districtName);
          kabupaten = capitalizeEachWord(locationData!.cityName);
          provinsi = capitalizeEachWord(locationData!.provinceName);
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    locationData = LocationData.defaultLocation();
    desa = '';
    kecamatan = '';
    kabupaten = '';
    provinsi = '';

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ChatBloc chatBloc = context.read<ChatBloc>();
    final currentUser = context.read<AuthBloc>().state;
    LandModel land = widget.landModel;
    String formattedHarga =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(land.harga);

    return Scaffold(
      bottomNavigationBar: currentUser.user!.id != land.userId
          ? SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // setupOneSignal(currentUser.user!.id);
                      final user =
                          await UserRepository().otherUser(land.userId as int);
                      iLog(user);

                      // / selected user
                      chatBloc.add(UserSelected(user.data!));
                      // / push to chat screen
                      mounted
                          ? Navigator.of(context)
                              .pushNamed(SingleChatPage.routeName)
                          : null;
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.chat_bubble_outline_rounded, color: Colors.white,),
                        SizedBox(width: 10,),
                        Text("Hubungi Penjual",
                            style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : null,
      appBar: AppBar(
        title: Text(land.judul),
      ),
      floatingActionButton: widget.isCrudPage
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => EditLandScreen(landModel: land)));
              },
              child: const Icon(Icons.edit),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(
            land.urlLandImage,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(
                        10), // Border radius to give rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 3, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: const Offset(
                            0, 3), // Offset to control the shadow direction
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Harga"),
                              Text(formattedHarga),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(
                        10), // Border radius to give rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 3, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: const Offset(
                            0, 3), // Offset to control the shadow direction
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Luas"),
                              Text("${land.luas} m\u00B2"),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(
                        10), // Border radius to give rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 3, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: const Offset(
                            0, 3), // Offset to control the shadow direction
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Alamat"),
                              const Divider(),
                              Text(
                                  "${land.alamat}, Desa $desa, Kecamatan $kecamatan, Kabupaten/Kota $kabupaten, Provinsi $provinsi"),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(
                        10), // Border radius to give rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 3, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: const Offset(
                            0, 3), // Offset to control the shadow direction
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Keterangan"),
                              const Divider(),
                              Text(land.keterangan as String),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
