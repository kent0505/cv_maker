class Skill {
  Skill({
    required this.id,
    required this.title,
  });

  final int id;
  String title;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      id: map['id'],
      title: map['title'],
    );
  }
}
