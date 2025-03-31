class Education {
  Education({
    required this.id,
    required this.name,
    required this.faculty,
    required this.specialization,
    required this.startYear,
    required this.endYear,
  });

  final int id;
  String name;
  String faculty;
  String specialization;
  int startYear;
  int endYear;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'faculty': faculty,
      'specialization': specialization,
      'startYear': startYear,
      'endYear': endYear,
    };
  }

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      id: map['id'],
      name: map['name'],
      faculty: map['faculty'],
      specialization: map['specialization'],
      startYear: map['startYear'],
      endYear: map['endYear'],
    );
  }
}
