import 'dart:developer';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text('Countries'),
        actions: <Widget>[
          _isFiltered
              ? IconButton(onPressed: _removeFilter, icon: Icon(Icons.undo))
              : IconButton(onPressed: _showFilter, icon: Icon(Icons.filter_alt))
        ],
      ),
      body: Center(
        child:
            _showLoader ? LoaderComponent(text: 'Loading...') : _getContent(),
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
          message: 'validate your internet connection...',
          actions: <AlertDialogAction>[
            AlertDialogAction(key: null, label: 'Accept'),
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
              ? 'there are no countries with that sequence of letters'
              : 'no registered countries...',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
              onTap: () => _goInf(e),
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://static.thenounproject.com/png/75231-200.png',
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                        height: 80,
                        width: 80,
                        placeholder: (context, url) => const Image(
                          image: NetworkImage(
                              'https://www.kananss.com/wp-content/uploads/2021/06/51-519068_loader-loading-progress-wait-icon-loading-icon-png-1.png'),
                          fit: BoxFit.cover,
                          height: 80,
                          width: 80,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'Pais: ${e.name}',
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Capital: ${e.capital}',
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios),
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
            title: Text('filter countries:'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('enter the first letters...'),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'search model...',
                      labelText: 'search',
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
                  child: Text('Cancel')),
              TextButton(onPressed: () => _filter(), child: Text('Filter')),
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

  void _goInf(Country country) async {
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
