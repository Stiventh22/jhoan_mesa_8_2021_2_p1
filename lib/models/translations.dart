class Translation {
  String br = '';
  String pt = '';
  String nl = '';
  String hr = '';
  String fa = '';
  String de = '';
  String es = '';
  String fr = '';
  String ja = '';
  String it = '';
  String hu = '';

  Translation(
      {required this.br,
      required this.pt,
      required this.nl,
      required this.hr,
      required this.fa,
      required this.de,
      required this.es,
      required this.fr,
      required this.ja,
      required this.it,
      required this.hu});

  Translation.fromJson(Map<String, dynamic> json) {
    br = json['br'];
    pt = json['pt'];
    nl = json['nl'];
    hr = json['hr'];
    fa = json['fa'];
    de = json['de'];
    es = json['es'];
    fr = json['fr'];
    ja = json['ja'];
    it = json['it'];
    hu = json['hu'];
  }
}
