import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:penjualan_tanah_fe/pages/components/tanah_card.dart';
import 'package:penjualan_tanah_fe/repositories/land/land_repository.dart';
import 'package:penjualan_tanah_fe/repositories/location/location_repository.dart';
import 'package:penjualan_tanah_fe/widget/blank_content.dart';

import '../../models/land_model.dart';
import '../../utils/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LandRepository _landRepository = LandRepository();
  bool isLoading = true;

  List<LandModel> lands = [];

  Future<List<LandModel>> fetchLands() async {
    try {
      final response = await _landRepository.getLands();
      iLog(response.data);
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
      setState(() {
        lands = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/tanahlogo.png',
            height: 40.0), // Adjust the height as needed
      ),
      body: lands.isEmpty
          ? BlankContent(
              content: "Tanah Belum ada",
              isLoading: isLoading,
              icon: Icons.landscape_outlined,
            )
          : ListView.builder(
              itemCount: (lands.length / 2).ceil(),
              itemBuilder: (context, index) {
                int startIndex = index * 2;
                int endIndex = (index + 1) * 2;
                if (endIndex > lands.length) {
                  endIndex = lands.length;
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      for (int i = startIndex; i < endIndex; i++)
                        Expanded(
                          child: TanahCard(
                            landModel: lands[i],
                            imageUrl: lands[i].urlLandImage,
                            judul: lands[i].judul,
                            harga: lands[i].harga,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
