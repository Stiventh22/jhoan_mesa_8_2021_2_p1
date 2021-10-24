import 'package:jhoan_mesa_8_2021_2_p1/models/country.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InfoCountriesScreen extends StatefulWidget {
  final Country country;

  InfoCountriesScreen({required this.country});

  @override
  _InfoCountriesScreenState createState() => _InfoCountriesScreenState();
}

class _InfoCountriesScreenState extends State<InfoCountriesScreen> {
  String _name = '';
  String _alpha2Code = '';
  String _alpha3Code = '';
  String _capital = '';
  String _subregion = '';
  String _region = '';
  int _population = 0;
  String _demonym = '';
  double _area = 0;
  String _nativeName = '';
  String _numericCode = '';
  String _flag = '';
  String _cioc = '';
  bool _independent = false;
  List<dynamic> _latlng = [];
  List<dynamic> _topLevelDomain = [];
  List<dynamic> _callingCodes = [];
  List<dynamic> _altSpellings = [];
  List<dynamic> _timezones = [];
  List<dynamic> _borders = [];
  List<dynamic> _currencies = [];
  List<dynamic> _languages = [];
  List<dynamic> _regionalBlocs = [];
  Map<String, dynamic> _flags = {};
  Map<String, dynamic> _translations = {};

  @override
  void initState() {
    super.initState();
    _name = widget.country.name;
    _alpha2Code = widget.country.alpha2Code;
    _alpha3Code = widget.country.alpha3Code;
    _capital = widget.country.capital;
    _subregion = widget.country.subregion;
    _region = widget.country.region;
    _population = widget.country.population;
    _demonym = widget.country.demonym;
    _area = widget.country.area;
    _nativeName = widget.country.nativeName;
    _numericCode = widget.country.numericCode;
    _flag = widget.country.flag;
    _cioc = widget.country.cioc;
    _independent = widget.country.independent;
    _latlng = widget.country.latlng;
    _topLevelDomain = widget.country.topLevelDomain;
    _callingCodes = widget.country.callingCodes;
    _altSpellings = widget.country.altSpellings;
    _timezones = widget.country.timezones;
    _borders = widget.country.borders;
    _currencies = widget.country.currencies;
    _languages = widget.country.languages;
    _regionalBlocs = widget.country.regionalBlocs;
    _flags = widget.country.flags;
    _translations = widget.country.translations;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        title: Text('Paises'),
      ),
      body: Center(
        child: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              // child: CachedNetworkImage(
              //   imageUrl: '${_flags[1]}',
              //   errorWidget: (context, url, error) => Icon(Icons.error),
              //   fit: BoxFit.cover,
              //   height: 100,
              //   width: 100,
              //   placeholder: (context, url) => Image(
              //     image: AssetImage('assets/noimage.png'),
              //     fit: BoxFit.cover,
              //     height: 100,
              //     width: 100,
              //   ),
              // ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\n name: ${_name} \n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'alpha2Code: ${_alpha2Code} \n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'alpha3Code: ${_alpha3Code} \n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'capital: ${_capital} \n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'subregion: ${_subregion} \n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'region: ${_region} \n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'population: ${_population} \n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'demonym: ${_demonym} \n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'area: ${_area} \n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'nativeName: ${_nativeName} \n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'numericCode: ${_numericCode} \n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'cioc: ${_cioc} \n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'independent: ${_independent} \n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cordenadas: \n' +
                      '            ● name: ${_latlng[0]}\n' +
                      '            ● acronym: ${_latlng[1]}\n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'topLevelDomain: \n' +
                      '            ● name: ${_topLevelDomain[0]}\n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'callingCodes: \n' +
                      '            ● name: ${_callingCodes[0]}\n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'altSpellings: \n' +
                      '            ● name: ${_altSpellings[0]}\n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'timezones: ${_timezones[0]} \n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'borders: \n' +
                      '            ● name: ${_borders[0]}\n' +
                      '            ● name: ${_borders[1]}\n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'currencies: \n' + '            ● name: ${_currencies[0]}\n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'lenguages: \n' + '            ● name: ${_languages[0]}\n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'regionalBlocs: \n' +
                      '            ● name: ${_regionalBlocs[0]}\n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'translations: \n' +
                      '            ● br: ${_translations[0]}\n' +
                      '            ● pt: ${_translations[1]}\n' +
                      '            ● nl: ${_translations[2]}\n' +
                      '            ● hr: ${_translations[3]}\n' +
                      '            ● fa: ${_translations[4]}\n' +
                      '            ● de: ${_translations[5]}\n' +
                      '            ● es: ${_translations[6]}\n' +
                      '            ● fr: ${_translations[7]}\n' +
                      '            ● ja: ${_translations[8]}\n' +
                      '            ● it: ${_translations[9]}\n' +
                      '            ● hu: ${_translations[10]}\n',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
