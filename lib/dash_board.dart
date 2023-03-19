import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {

   DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
  Size size=MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.15,
      child: SingleChildScrollView(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
                radius: 20,
                child: Image.network(
                    fit: BoxFit.cover,
                    "https://images.fastcompany.net/image/upload/w_1280,f_auto,q_auto,fl_lossy/w_596,c_limit,q_auto:best,f_auto/fc/3034007-inline-i-applelogo.jpg")),
            _destination(context),
            _lastFour(context)
          ],
        ),
      ),
    );
  }

  Widget _destination(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1), borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: TextButton(
              child: Text(
                "Anywhere",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                print('text');
              },
            ),
          ),
          TextButton(
            child: Text("week"),
            onPressed: () {},
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: TextField(
                  decoration: InputDecoration(hintText: "add guests"))),
          Icon(Icons.search),
        ],
      ),
    );
  }

  Widget _lastFour(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
            hoverColor: Colors.greenAccent,
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Rent your home",
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.location_city_rounded),
        ),
        SizedBox(
          width: 20,
        ),
        Icon(Icons.handyman),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.circle)
      ],
    );
  }
}
