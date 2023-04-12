// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CagegoryItem extends StatelessWidget {
  //  CategoryItem({super.key});

   String title;
   int price;
   String location;
   CagegoryItem({
    Key? key,
    required this.title,
    required this.price,
    required this.location,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(child: Text("category"),);
  }
}
