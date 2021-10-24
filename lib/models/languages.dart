class Languages {
  String iso6391 = '';
  String iso6392 = '';
  String name = '';
  String nativeName = '';

  Languages(
      {required this.iso6391,
      required this.iso6392,
      required this.name,
      required this.nativeName});

  Languages.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso639_1'];
    iso6392 = json['iso639_2'];
    name = json['name'];
    nativeName = json['nativeName'];
  }
}
