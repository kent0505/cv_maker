class Onboard {
  final String title1;
  final String title2;
  final String title3;
  final String desc1;
  final String desc2;
  final String desc3;

  Onboard({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.desc1,
    required this.desc2,
    required this.desc3,
  });

  factory Onboard.fromJson(Map<String, dynamic> json) {
    return Onboard(
      title1: json['title1'],
      title2: json['title2'],
      title3: json['title3'],
      desc1: json['desc1'],
      desc2: json['desc2'],
      desc3: json['desc3'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title1': title1,
      'title2': title2,
      'title3': title3,
      'desc1': desc1,
      'desc2': desc2,
      'desc3': desc3,
    };
  }
}
