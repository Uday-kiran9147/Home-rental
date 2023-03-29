// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HouseDetailScreen extends StatelessWidget {
  String title;
  String country;
  String state;
  String locality;
  int price;

  HouseDetailScreen({
    Key? key,
    required this.title,
    required this.country,
    required this.state,
    required this.locality,
    required this.price,
  }) : super(key: key);

  static const routeName = 'house-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
            ),
            Text('${country}, ${state}, ${locality}'),
            Text(price.toString()),
            Divider(),
            Text('List of Offerings')
          ],
        ),
      ),
    );
  }
}
