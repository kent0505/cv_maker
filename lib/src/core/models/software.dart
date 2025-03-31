class Software {
  Software({
    required this.id,
    required this.title,
    required this.level,
  });

  final int id;
  String title;
  String level;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'level': level,
    };
  }

  factory Software.fromMap(Map<String, dynamic> map) {
    return Software(
      id: map['id'],
      title: map['title'],
      level: map['level'],
    );
  }
}
