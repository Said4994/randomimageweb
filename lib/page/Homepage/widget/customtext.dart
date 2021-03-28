import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      left: 100,
      child: Text(
        "Created\n by Said KURT",
        style: GoogleFonts.adventPro(
            decoration: TextDecoration.none, fontSize: 17, color: Colors.white),
      ),
    );
  }
}
