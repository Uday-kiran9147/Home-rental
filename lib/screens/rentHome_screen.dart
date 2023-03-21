import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RentHome extends StatelessWidget {
  const RentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(children: [
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
        ]),
      ),
    );
  }
}
