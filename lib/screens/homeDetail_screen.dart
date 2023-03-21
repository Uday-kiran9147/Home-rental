import 'package:flutter/material.dart';

class HomeDetailScreen extends StatelessWidget {
  const HomeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            //-----------------------stack-----------------------------------------------
            Stack(children: [
              Container(
                child: Image.network('src'),
                height: MediaQuery.of(context).size.height * 0.50,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
              ),
              Positioned(
                right: 25,
                top: 25,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border_rounded)),
              )
            ]),
            //---------------------End Stack--------------------
            Row(
              children: [
                Text("ahmedabad"),
                Text("Gujatat"),
                Text("India"),
              ],
            ),
            Divider(),
            Text("What this Place offers"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) => ListTile(
                title: Text("offerings"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
