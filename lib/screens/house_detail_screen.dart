// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


class HouseDetailScreen extends StatelessWidget {
  String title;
  HouseDetailScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  static const routeName='house-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      
    );
  }
}
