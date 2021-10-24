import 'dart:developer';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jhoan_mesa_8_2021_2_p1/components/loader_component.dart';
import 'package:jhoan_mesa_8_2021_2_p1/helpers/api_helper.dart';
import 'package:jhoan_mesa_8_2021_2_p1/helpers/constans.dart';
import 'package:jhoan_mesa_8_2021_2_p1/models/country.dart';
import 'package:jhoan_mesa_8_2021_2_p1/models/response.dart';
import 'package:jhoan_mesa_8_2021_2_p1/screens/info_countries_screen.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  List<dynamic> _countries = [];
  bool _showLoader = false;
  bool _isFiltered = false;
  String _search = '';

  @override
  void initState() {
    super.initState();
    _getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        title: Text('Paises'),
        actions: <Widget>[
          _isFiltered
              ? IconButton(
                  onPressed: _removeFilter, icon: Icon(Icons.filter_none))
              : IconButton(onPressed: _showFilter, icon: Icon(Icons.filter_alt))
        ],
      ),
      body: Center(
        child: _showLoader
            ? LoaderComponent(text: 'Por favor espere...')
            : _getContent(),
      ),
    );
  }

  Future<Null> _getCountries() async {
    setState(() {
      _showLoader = true;
    });

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _showLoader = false;
      });
      await showAlertDialog(
          context: context,
          title: 'Error',
          message: 'Verifica que estes conectado a internet.',
          actions: <AlertDialogAction>[
            AlertDialogAction(key: null, label: 'Aceptar'),
          ]);
      return;
    }

    Response response = await ApiHelper.getCountries();

    setState(() {
      _showLoader = false;
    });

    setState(() {
      _countries = response.result;
    });
  }

  Widget _getContent() {
    return _countries.length == 0 ? _noContent() : _getListView();
  }

  Widget _noContent() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Text(
          _isFiltered
              ? 'No hay paises con ese criterio de búsqueda.'
              : 'No hay paises registradas.',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _getListView() {
    return RefreshIndicator(
      onRefresh: _getCountries,
      child: ListView(
        children: _countries.map((e) {
          return Card(
            child: InkWell(
              onTap: () => _goEdit(e),
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pais: ${e.name}',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Capital: ${e.capital}',
                        ),
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(25),
                        //   child: CachedNetworkImage(
                        //     imageUrl: '${e.flags[0]}',
                        //     errorWidget: (context, url, error) => Icon(Icons.error),
                        //     fit: BoxFit.cover,
                        //     height: 25,
                        //     width: 25,
                        //     placeholder: (context, url) => Image(
                        //       image: AssetImage('assets/noimage.png'),
                        //       fit: BoxFit.cover,
                        //       height: 25,
                        //       width: 25,
                        //     ),
                        //   ),
                        // ),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _removeFilter() {
    setState(() {
      _isFiltered = false;
    });
    _getCountries();
  }

  void _showFilter() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text('Filtrar Paises'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Escriba las primeras letras del pais'),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'Criterio de búsqueda...',
                      labelText: 'Buscar',
                      suffixIcon: Icon(Icons.search)),
                  onChanged: (value) {
                    _search = value;
                  },
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancelar')),
              TextButton(onPressed: () => _filter(), child: Text('Filtrar')),
            ],
          );
        });
  }

  void _filter() {
    if (_search.isEmpty) {
      return;
    }

    List<Country> filteredList = [];
    for (var brand in _countries) {
      if (brand.name.toLowerCase().contains(_search.toLowerCase())) {
        filteredList.add(brand);
      }
    }

    setState(() {
      _countries = filteredList;
      _isFiltered = true;
    });

    Navigator.of(context).pop();
  }

  void _goEdit(Country country) async {
    String? result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => InfoCountriesScreen(
                  country: country,
                )));
    if (result == 'yes') {
      _getCountries();
    }
  }
}
