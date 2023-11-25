import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:penjualan_tanah_fe/models/land_model.dart';
import 'package:penjualan_tanah_fe/pages/tanah/edit_page.dart';
import 'package:penjualan_tanah_fe/repositories/location/location_repository.dart';
import 'package:penjualan_tanah_fe/utils/utils.dart';

import '../../models/location_model.dart';

class ShowPage extends StatefulWidget {
  final LandModel landModel;

  const ShowPage({Key? key, required this.landModel}) : super(key: key);

  static const routeName = 'show-page-tanah';
  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  LocationData? locationData;
  String? desa, kecamatan, kabupaten, provinsi;

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
    LandModel land = widget.landModel;

    String formattedHarga =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(land.harga);

    return Scaffold(
      appBar: AppBar(
        title: Text(land.judul),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => EditLandScreen(landModel: land)));
        },
        child: Icon(Icons.edit),
      ),
      body: Column(children: [
        Image.network(
          land.urlLandImage,
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(
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
                      offset: Offset(
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
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Harga"),
                            Text(formattedHarga),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              SizedBox(
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
                      offset: Offset(
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
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Luas"),
                            Text("${land.luas} m\u00B2"),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              SizedBox(
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
                      offset: Offset(
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
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Alamat"),
                            Divider(),
                            Text(
                                "${land.alamat}, Desa $desa, Kecamatan $kecamatan, Kabupaten/Kota $kabupaten, Provinsi $provinsi"),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              SizedBox(
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
                      offset: Offset(
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
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Keterangan"),
                            Divider(),
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
    );
  }
}
