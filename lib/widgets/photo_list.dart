
import 'package:flutter/material.dart';

import '../models/property.dart';

class photoList extends StatelessWidget {
  const photoList({
    super.key,
    required this.selectedHouse,
  });

  final HouseProperty selectedHouse;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: selectedHouse.photos.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                      selectedHouse.photos[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
