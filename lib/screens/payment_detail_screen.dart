import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:houserental/screens/paymentScreen.dart';
import 'package:houserental/utils/pricebeautify.dart';
import 'package:provider/provider.dart';

class HousePaymentDetailsScreen extends StatelessWidget {
  static const routeName = 'house-payment-details';
  @override
  Widget build(BuildContext context) {
    final houseid = ModalRoute.of(context)!.settings.arguments;

    final appstate = Provider.of<MyAppState>(context);
    final selectedHouse = appstate.allhouseGetter.firstWhere(
      (element) => element.propertyid == houseid,
    );
    double price = selectedHouse.price; // example price
    double pricewithdays = price * 3; // example tax rate
    double cleaning = selectedHouse.cleaningfee;

    double finalPrice = pricewithdays + cleaning;

    print('Price: ${price.toStringAsFixed(2)}');
    print('Tax: ${pricewithdays.toStringAsFixed(2)}');
    print('Final Price: ${finalPrice.toStringAsFixed(2)}');

    return Scaffold(
      appBar: AppBar(
        title: Text('House Payment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Property Address",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '${selectedHouse.address.country}-  ${selectedHouse.address.state}- ${selectedHouse.address.street}- ${selectedHouse.address.zipcode}',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Mortgage Payment',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  priceBeautify(selectedHouse.price.toString()),
                  SizedBox(width: 10.0),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                'Property Tax',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Text(
                    '\$500',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'due on',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'April 15, 2023',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              DataTable(
                columns: [
                  DataColumn(label: Text('source')),
                  DataColumn(label: Text('price')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text(
                      "\$${price} x3".toString().replaceAllMapped(
                          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                          (match) => '${match[1]},'),
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                    DataCell(
                        dataTablepriceBeautify((pricewithdays).toString())),
                  ]),
                  DataRow(cells: [
                    DataCell(Text(
                      'cleaning fee',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )),
                    DataCell(dataTablepriceBeautify(cleaning.toString())),
                  ]),
                  DataRow(cells: [
                    DataCell(Text(
                      "Total",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).hintColor,
                      ),
                    )),
                    DataCell(dataTablepriceBeautify(finalPrice.toString())),
                  ]),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentScreen()));
                },
                child: Container(
                  height: 50,
                  child: Text('Pay'),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
