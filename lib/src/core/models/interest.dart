class Interest {
  Interest({
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

  factory Interest.fromMap(Map<String, dynamic> map) {
    return Interest(
      id: map['id'],
      title: map['title'],
    );
  }
}
