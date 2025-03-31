class Honor {
  Honor({
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

  factory Honor.fromMap(Map<String, dynamic> map) {
    return Honor(
      id: map['id'],
      title: map['title'],
    );
  }
}
