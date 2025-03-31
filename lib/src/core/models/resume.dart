class Resume {
  Resume({
    required this.id,
    required this.photo,
    required this.name,
    required this.phone,
    required this.email,
    required this.residence,
    required this.birth,
    required this.job,
    required this.languageID,
    required this.educationID,
    required this.experienceID,
    required this.projectID,
    required this.skillID,
    required this.softwareID,
    required this.interestID,
    required this.honorID,
    required this.about,
  });

  final int id;
  String photo;
  String name;
  String phone;
  String email;
  String residence;
  String birth;
  String job;
  int languageID;
  int educationID;
  int experienceID;
  int projectID;
  int skillID;
  int softwareID;
  int interestID;
  int honorID;
  String about;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'photo': photo,
      'name': name,
      'phone': phone,
      'email': email,
      'residence': residence,
      'birth': birth,
      'job': job,
      'languageID': languageID,
      'educationID': educationID,
      'experienceID': experienceID,
      'projectID': projectID,
      'skillID': skillID,
      'softwareID': softwareID,
      'interestID': interestID,
      'honorID': honorID,
      'about': about,
    };
  }

  factory Resume.fromMap(Map<String, dynamic> map) {
    return Resume(
      id: map['id'],
      photo: map['photo'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      residence: map['residence'],
      birth: map['birth'],
      job: map['job'],
      languageID: map['languageID'],
      educationID: map['educationID'],
      experienceID: map['experienceID'],
      projectID: map['projectID'],
      skillID: map['skillID'],
      softwareID: map['softwareID'],
      interestID: map['interestID'],
      honorID: map['honorID'],
      about: map['about'],
    );
  }
}
