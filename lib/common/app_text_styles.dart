import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  /*static TextStyle getAppTextStyle(
		{double size = 14,
		FontWeight weight = FontWeight.normal,
		FontStyle style = FontStyle.normal,
		Color color = Colors.black}) {
	  return TextStyle(
		  color: color,
		  fontSize: size,
		  fontWeight: weight,
		  fontStyle: style,
		  fontFamily: "Jost"
	}*/

  static TextStyle titleItemStyle = GoogleFonts.openSans(
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
  static TextStyle detailItemStyle = GoogleFonts.openSans(
    fontWeight: FontWeight.w300,
    fontSize: 16,
  );
}
