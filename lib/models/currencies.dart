class Currencies {
  String code = '';
  String name = '';
  String symbol = '';

  Currencies({required this.code, required this.name, required this.symbol});

  Currencies.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    symbol = json['symbol'];
  }
}
