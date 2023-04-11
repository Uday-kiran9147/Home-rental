import 'package:flutter/material.dart';
import 'package:checkout_screen_ui/checkout_page.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});
  final List<PriceItem> _priceItems = [
    PriceItem(name: 'Product A', quantity: 1, totalPriceCents: 5200),
    PriceItem(name: 'Product B', quantity: 2, totalPriceCents: 8599),
    PriceItem(name: 'Product C', quantity: 1, totalPriceCents: 2499),
    PriceItem(name: 'Delivery Charge', quantity: 1, totalPriceCents: 1599),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CheckoutPage(
      priceItems: _priceItems,
      payToName: 'Vendor Name Here',
      displayNativePay: true,
      onNativePay: () => print('Native Pay Clicked'),
      // isApple: Platform.isIOS,
      onCardPay: (results) =>
          print('Credit card form submitted with results: $results'),
      onBack: () => Navigator.of(context).pop(),
    ));
  }
}

/// Build a list of what the user is buying


// build the checkout ui
