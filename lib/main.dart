import 'package:flutter/material.dart';
import 'package:jhoan_mesa_8_2021_2_p1/screens/countries_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paises - Jhoan Mesa',
      home: CountriesScreen(),
    );
  }
}
