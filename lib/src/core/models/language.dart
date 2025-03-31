class Language {
  Language({
    required this.id,
    required this.language,
    required this.level,
  });

  final int id;
  String language;
  String level;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'language': language,
      'level': level,
    };
  }

  factory Language.fromMap(Map<String, dynamic> map) {
    return Language(
      id: map['id'],
      language: map['language'],
      level: map['level'],
    );
  }
}
