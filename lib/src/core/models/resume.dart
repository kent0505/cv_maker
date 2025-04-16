class Resume {
  Resume({
    required this.id,
    required this.template,
    required this.photo,
    required this.name,
    required this.phone,
    required this.email,
    required this.city,
    required this.birth,
    required this.job,
    required this.about,
  });

  final int id;
  int template;
  String photo;
  String name;
  String phone;
  String email;
  String city;
  String birth;
  String job;
  String about;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'template': template,
      'photo': photo,
      'name': name,
      'phone': phone,
      'email': email,
      'city': city,
      'birth': birth,
      'job': job,
      'about': about,
    };
  }

  factory Resume.fromMap(Map<String, dynamic> map) {
    return Resume(
      id: map['id'],
      template: map['template'],
      photo: map['photo'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      city: map['city'],
      birth: map['birth'],
      job: map['job'],
      about: map['about'],
    );
  }
}
