class Project {
  Project({
    required this.id,
    required this.name,
    required this.details,
    required this.startDate,
    required this.endDate,
  });

  final int id;
  String name;
  String startDate;
  String endDate;
  String details;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'startDate': startDate,
      'endDate': endDate,
      'details': details,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'],
      name: map['name'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      details: map['details'],
    );
  }
}
