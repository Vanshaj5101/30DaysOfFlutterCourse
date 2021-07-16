import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/provider_class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        cardColor: Colors.white,
        buttonColor: MyTheme.darkBluishColor,
        canvasColor: MyTheme.creamColor,
        accentColor: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          textTheme: Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        //brightness: Brightness.dark,
        cardColor: Colors.black,
        buttonColor: MyTheme.lightBluishColor,
        canvasColor: MyTheme.darkCreamColor,
        accentColor: Colors.white,

        appBarTheme: AppBarTheme(
          color: Colors.grey[900],
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          textTheme: Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
      );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Color(0xff212121);
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Color(0xff303F9F);
}
