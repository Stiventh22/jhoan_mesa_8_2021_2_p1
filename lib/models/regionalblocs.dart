class RegionalBloc {
  String acronym = '';
  String name = '';

  RegionalBloc({required this.acronym, required this.name});

  RegionalBloc.fromJson(Map<String, dynamic> json) {
    acronym = json['acronym'];
    name = json['name'];
  }
}
