import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kFabBgColor = Color(0xff476186);
final kBmiResultsTheme = GoogleFonts.poppins(
    color: const Color(0xff67932e), fontSize: 25, fontWeight: FontWeight.bold);
final kFabTextColor = GoogleFonts.poppins(color: Colors.white);
final kTextHeadingTheme = GoogleFonts.montserrat(
    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);
final kAppbarTextTheme = GoogleFonts.montserrat(
    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
const kSegmentedButtonColor = MaterialStatePropertyAll(Color(0xffd68f8a));
final kTextLabelTheme = GoogleFonts.poppins();

enum Gender { male, female }
