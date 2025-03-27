class Resume {
  Resume({
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

  factory Resume.fromMap(Map<String, dynamic> map) {
    return Resume(
      id: map['id'],
      title: map['title'],
    );
  }
}
