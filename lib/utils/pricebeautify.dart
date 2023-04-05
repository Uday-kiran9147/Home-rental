import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text priceBeautify(String price) {
  return Text(
    "\$${price}".toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]},'),
    style: GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
  );
}

Text dataTablepriceBeautify(String price) {
  return Text(
    "\$${price}".toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]},'),
    style: GoogleFonts.poppins(
      fontSize: 19,
      fontWeight: FontWeight.w600,
    ),
  );
}
