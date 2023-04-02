import 'package:flutter/material.dart';
import 'package:houserental/models/property.dart';

class HouseDetailScreen extends StatelessWidget {
  String title;
  String id;
  Address address;
  double price;

  HouseDetailScreen({
    Key? key,
    required this.id,
    required this.title,
    required this.address,
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
            Text('${address.country}, ${address.state}, ${address.zipcode}'),
            Text(price.toString()),
            Divider(),
          ],
        ),
      ),
    );
  }
}
