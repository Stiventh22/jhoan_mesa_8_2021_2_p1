import 'package:flutter/material.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({ Key? key }) : super(key: key);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  List<dynamic> _countries = [];
  bool _showLoader = false;
  bool _isFiltered = false;
  String :search = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}