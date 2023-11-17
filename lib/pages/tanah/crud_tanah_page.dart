import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:penjualan_tanah_fe/blocs/auth/auth_bloc.dart';
import 'package:penjualan_tanah_fe/models/land_model.dart';
import 'package:penjualan_tanah_fe/pages/tanah/create_page.dart';
import 'package:penjualan_tanah_fe/pages/tanah/show_page.dart';

import '../../repositories/land/land_repository.dart';
import '../../utils/logger.dart';

class CrudLandPage extends StatefulWidget {
  const CrudLandPage({Key? key}) : super(key: key);
  static const routeName = 'crud-land-page';
  @override
  _CrudLandPageState createState() => _CrudLandPageState();
}

class _CrudLandPageState extends State<CrudLandPage> {
  final LandRepository _landRepository = LandRepository();

  List<LandModel>? lands;

  Future<List<LandModel>> fetchLands() async {
    try {
      final response = await _landRepository.getLands();
      // iLog(response.data);
      return response.data!;
    } catch (e) {
      eLog(e);
      throw Exception('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchLands().then((value) {
      iLog(value);
      setState(() {
        lands = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = AuthBloc().state.user;
    return Scaffold(
      appBar: AppBar(
        title: Text('Land CRUD'),
        // leading: ,
      ),
      body: lands == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.all(15),
              itemCount: lands!.length,
              itemBuilder: (context, index) {
                String formattedHarga =
                    NumberFormat.currency(locale: 'id_ID', symbol: 'Rp')
                        .format(lands![index].harga);

                return Card(
                  child: Column(
                    children: [
                      // Image placeholder (replace with your image widget)
                      Image.network(
                        lands![index].urlLandImage,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      ListTile(
                        title: Text(lands![index].judul),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Harga: $formattedHarga'),
                            Text(
                                'Luas: ${lands![index].luas}'), // Assuming luas is a numeric value
                          ],
                        ),
                        onTap: () {
                          // Handle item tap (e.g., navigate to detail page)
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ShowPage(landModel: lands![index])));
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle button press (e.g., navigate to create page)
          Navigator.of(context).pushNamed(CreateLandScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
