import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:penjualan_tanah_fe/models/land_model.dart';

import '../tanah/show_page.dart';

class TanahCard extends StatelessWidget {
  final LandModel landModel;
  final String imageUrl;
  final String judul;
  final int harga;

  TanahCard({required this.imageUrl, required this.judul, required this.harga, required this.landModel});

  @override
  Widget build(BuildContext context) {
    String formattedHarga =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(harga);
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            child: Image.network(
              imageUrl,
              height: 150.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            onTap: () {
              // Handle item tap (e.g., navigate to detail page)
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShowPage(landModel: landModel)));
            },
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    judul,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    formattedHarga,
                    style: TextStyle(fontSize: 14.0, color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
