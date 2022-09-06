import 'package:flutter/material.dart';
import 'package:flutter_despesas_pessoais/views/home_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ExpensesApp());
}

const double bottomSheetBorderRadius = 25;

class ExpensesApp extends StatelessWidget {
  ExpensesApp({super.key});
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: tema.textTheme.copyWith(
          headline6: GoogleFonts.quicksand(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          button: GoogleFonts.quicksand(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(bottomSheetBorderRadius),
              topRight: Radius.circular(bottomSheetBorderRadius),
            ),
          ),
        ),
      ),
      home: const HomeView(),
    );
  }
}
