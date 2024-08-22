class UserModel {
  String? name;
  String? email;
  String? password;
  List<String>? classNo; // Change from String to List<String>
  String? profilePicture;
  String? school;
  String? role;
  String? rollNumber;
  String? id;
  String? subjectName;
  List<String>? subjects;

  UserModel({
    this.name,
    this.email,
    this.password,
    this.classNo,
    this.profilePicture,
    this.school,
    this.role,
    this.id,
    this.rollNumber,
    this.subjects,
  });



  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'class': classNo,
      'profilePicture': profilePicture,
      'selectedSchool': school,
      'role': role,
      'rollNumber': rollNumber,
      'subjects': subjects,
    };
  }
}
class Teacher {
  String name;
  String email;
  String password;
  String profilePicture;
  String teacherID;
  String subject;
  List<String> classes;

  Teacher({
    required this.name,
    required this.email,
    required this.password,
    this.profilePicture = '',
    this.teacherID = '',
    this.subject = '',
    this.classes = const [],
  });

}
