import 'package:flutter/material.dart';

class SerachPage extends StatefulWidget {
  const SerachPage({ Key? key }) : super(key: key);

  @override
  _SerachPageState createState() => _SerachPageState();
}

class _SerachPageState extends State<SerachPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('Search Page'),
      ),
    );
  }
}