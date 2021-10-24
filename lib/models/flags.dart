class Flags {
  String svg = '';
  String png = '';

  Flags({required this.svg, required this.png});

  Flags.fromJson(Map<String, dynamic> json) {
    svg = json['svg'];
    png = json['png'];
  }
}
