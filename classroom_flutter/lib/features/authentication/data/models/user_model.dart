class UserModel {
  final String id;
  final String name;
  final String email;
  //list of classes they are enrolled in
  final List<String> classes;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.classes = const [],
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      classes: json['classes'] != null
          ? List<String>.from(json['classes'])
          : <String>[],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'classes': classes,
    };
  }
}
