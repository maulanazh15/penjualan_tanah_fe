import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:penjualan_tanah_fe/blocs/auth/auth_bloc.dart';
import 'package:penjualan_tanah_fe/models/land_model.dart';
import 'package:penjualan_tanah_fe/pages/components/navigation_bar_component.dart';
import 'package:penjualan_tanah_fe/pages/profile/profile_page.dart';
import 'package:penjualan_tanah_fe/pages/tanah/create_page.dart';
import 'package:penjualan_tanah_fe/pages/tanah/show_page.dart';

import '../../repositories/land/land_repository.dart';
import '../../utils/logger.dart';
import '../../widget/blank_content.dart';

class CrudLandPage extends StatefulWidget {
  const CrudLandPage({Key? key}) : super(key: key);
  static const routeName = 'crud-land-page';
  @override
  _CrudLandPageState createState() => _CrudLandPageState();
}

class _CrudLandPageState extends State<CrudLandPage> {
  final LandRepository _landRepository = LandRepository();
  bool isLoading = true;

  List<LandModel> lands = [];

  Future<List<LandModel>> fetchLands() async {
    try {
      final response = await _landRepository.getUserLands();
      // iLog(response.data);
      return response.data!;
    } catch (e) {
      eLog(e);
      throw Exception('Error: $e');
    }
  }

  @override
  void initState() {
    fetchLands().then((value) {
      setState(() {
        lands = value;
        iLog(lands);
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = AuthBloc().state.user;
    return Scaffold(
      appBar: AppBar(
        title: Text('Land CRUD'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (_) => NavigationBarComponent(
                        selectedIndex: 2,
                      )));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: lands.isEmpty
          ?
          // Center(child: CircularProgressIndicator())
          BlankContent(
              content: "Tanah belum dibuat",
              isLoading: isLoading,
              icon: Icons.landscape_outlined,
            )
          : ListView.builder(
              padding: EdgeInsets.all(15),
              itemCount: lands!.length,
              itemBuilder: (context, index) {
                String formattedHarga =
                    NumberFormat.currency(locale: 'id_ID', symbol: 'Rp')
                        .format(lands![index].harga);

                return Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      // Image placeholder (replace with your image widget)
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(8.0)),
                        child: Image.network(
                          lands![index].urlLandImage,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ListTile(
                        title: Text(lands![index].judul),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Harga: $formattedHarga'),
                            Text(
                                'Luas: ${lands![index].luas} m\u00B2'), // Assuming luas is a numeric value
                          ],
                        ),
                        onTap: () {
                          // Handle item tap (e.g., navigate to detail page)
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ShowPage(landModel: lands![index], isCrudPage: true,)));
                        },
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Hapus Data Tanah'),
                                  content: Text(
                                      "Apakah Anda yakin inign menghapus data tanah ini?"),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          LandRepository()
                                              .deleteLand(
                                                  lands[index].id!.toInt())
                                              .then((value) {
                                            setState(() {
                                                  lands.remove(lands[index]);
                                            });
                                          Navigator.pop(context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "Hapus Data Berhasil")));
                                            
                                          });
                                        },
                                        child: const Text("Ya")),
                                    OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Tidak"))
                                  ],
                                );
                              });
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
