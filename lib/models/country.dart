class Country {
  String name = '';
  List<dynamic> topLevelDomain = [];
  String alpha2Code = '';
  String alpha3Code = '';
  List<dynamic> callingCodes = [];
  String capital = '';
  List<dynamic> altSpellings = [];
  String subregion = '';
  String region = '';
  int population = 0;
  List<dynamic> latlng = [];
  String demonym = '';
  double area = 0;
  List<dynamic> timezones = [];
  List<dynamic> borders = [];
  String nativeName = '';
  String numericCode = '';
  Map<String, dynamic> flags = {};
  List<dynamic> currencies = [];
  List<dynamic> languages = [];
  Map<String, dynamic> translations = {};
  String flag = '';
  List<dynamic> regionalBlocs = [];
  String cioc = '';
  bool independent = false;

  Country(
      {required this.name,
      required this.topLevelDomain,
      required this.alpha2Code,
      required this.alpha3Code,
      required this.callingCodes,
      required this.capital,
      required this.altSpellings,
      required this.subregion,
      required this.region,
      required this.population,
      required this.latlng,
      required this.demonym,
      required this.area,
      required this.timezones,
      required this.borders,
      required this.nativeName,
      required this.numericCode,
      required this.flags,
      required this.currencies,
      required this.languages,
      required this.translations,
      required this.flag,
      required this.regionalBlocs,
      required this.cioc,
      required this.independent});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    topLevelDomain = json['topLevelDomain'];
    alpha2Code = json['alpha2Code'];
    alpha3Code = json['alpha3Code'];
    callingCodes = json['callingCodes'];
    (json['capital'] != null) ? capital = json['capital'] : capital = '';
    if (json['altSpellings'] != null) {
      altSpellings = [];
      json['altSpellings'].forEach((v) {
        altSpellings.add(v);
      });
    }
    subregion = json['subregion'];
    region = json['region'];
    population = json['population'];
    if (json['latlng'] != null) {
      latlng = [];
      json['latlng'].forEach((v) {
        latlng.add(v);
      });
    }
    (json['demonym'] != null) ? demonym = json['demonym'] : demonym = '';
    (json['area'] != null) ? area = json['area'] : area = 0;
    if (json['timezones'] != null) {
      timezones = [];
      json['timezones'].forEach((v) {
        timezones.add(v);
      });
    }
    if (json['borders'] != null) {
      borders = [];
      json['borders'].forEach((v) {
        borders.add(v);
      });
    }
    (json['nativeName'] != null)
        ? nativeName = json['nativeName']
        : nativeName = '';
    (json['numericCode'] != null)
        ? numericCode = json['numericCode']
        : numericCode = '';
    flags = json['flags'];
    if (json['currencies'] != null) {
      currencies = [];
      json['currencies'].forEach((v) {
        currencies.add(v);
      });
    }
    languages = json['languages'];
    translations = json['translations'];
    flag = json['flag'];
    if (json['regionalBlocs'] != null) {
      regionalBlocs = [];
      json['regionalBlocs'].forEach((v) {
        regionalBlocs.add(v);
      });
    }
    (json['cioc'] != null) ? cioc = json['cioc'] : cioc = '';
    independent = json['independent'];
  }
}
