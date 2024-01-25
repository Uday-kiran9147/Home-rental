import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/appstate.dart';

class RentHouses extends StatefulWidget {
  const RentHouses({
    super.key,
  });
  static const routeName = 'rent-house';

  @override
  State<RentHouses> createState() => _RentHousesState();
}

class _RentHousesState extends State<RentHouses> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Rent Houses'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 140,
              width: MediaQuery.of(context).size.width * 0.90,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColorDark,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.90 / 3,
                        child: Text(
                          'Uday kiran',
                          textAlign: TextAlign.center,
                        )),
                    Image.network(
                      'https://clipart-library.com/image_gallery/n746946.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              )),
          Card(
            // height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () => Navigator.pushNamed(context, RentHouses.routeName),
                title: const Text('Fill House Details'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: appState.allhouseGetter.length,
              itemBuilder: (context, index) => Card(
                elevation: 5,
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    // Handle tapping on a house item
                    // You can navigate to the house details screen here.
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  appState.allhouseGetter[index].photos[0]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                appState.allhouseGetter[index].housetitle,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$${appState.allhouseGetter[index].price.toStringAsFixed(2)} per night',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
