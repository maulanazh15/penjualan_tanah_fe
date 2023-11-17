import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:penjualan_tanah_fe/models/land_model.dart';
import 'package:penjualan_tanah_fe/pages/tanah/edit_page.dart';

class ShowPage extends StatefulWidget {
  final LandModel landModel;

  const ShowPage({Key? key, required this.landModel}) : super(key: key);

  static const routeName = 'show-page-tanah';
  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
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
        SizedBox(
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
        SizedBox(
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
                    Text("${land.alamat}, Desa ${land.subDisId}"),
                  ],
                ),
              )
            ]),
          ),
        ),
        SizedBox(
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
      ]),
    );
  }
}
