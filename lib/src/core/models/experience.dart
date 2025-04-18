class Experience {
  Experience({
    required this.id,
    required this.company,
    required this.location,
    required this.introduction,
    required this.details,
    required this.startDate,
    required this.endDate,
  });

  final int id;
  String company;
  String location;
  String introduction;
  String details;
  String startDate;
  String endDate;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'company': company,
      'location': location,
      'introduction': introduction,
      'details': details,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory Experience.fromMap(Map<String, dynamic> map) {
    return Experience(
      id: map['id'],
      company: map['company'],
      location: map['location'],
      introduction: map['introduction'],
      details: map['details'],
      startDate: map['startDate'],
      endDate: map['endDate'],
    );
  }
}
