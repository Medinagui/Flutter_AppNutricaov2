const String tableUsers = 'Users';

class UsersFields {
  static final List<String> values = [name, email, password, imagePath];

  static const String name = 'name';
  static const String email = 'email';
  static const String password = 'password';
  static const String imagePath = 'imagePath';
  static const String birthDateD = 'birthDateD';
  static const String birthDateM = 'birthDateM';
  static const String birthDateA = 'birthDateA';
  static const String hash = 'hashCode';
}

class User {
  String name;
  String email;
  String password;
  String imagePath;
  int birthDateD;
  int birthDateM;
  int birthDateA;
  
  User(
      {required this.name,
      required this.email,
      required this.password,
      required this.imagePath,
      required this.birthDateD,
      required this.birthDateM,
      required this.birthDateA});

  Map<String, dynamic> toJson() => {
        UsersFields.name: name,
        UsersFields.email: email,
        UsersFields.password: password,
        UsersFields.imagePath: imagePath,
        UsersFields.birthDateD: birthDateD,
        UsersFields.birthDateM: birthDateM,
        UsersFields.birthDateA: birthDateA
      };

  User copy({
    String? name,
    String? email,
    String? password,
    String? imagePath,
    int? birthDateD,
    int? birthDateM,
    int? birthDateA,
  }) =>
      User(
          name: name ?? this.name,
          email: email ?? this.email,
          password: password ?? this.password,
          imagePath: imagePath ?? this.imagePath,
          birthDateD: birthDateD ?? this.birthDateD,
          birthDateM: birthDateM ?? this.birthDateM,
          birthDateA: birthDateA ?? this.birthDateA);

  static User fromJson(Map<String, dynamic> json) => User(
        name: json[UsersFields.name] as String,
        email: json[UsersFields.email] as String,
        password: json[UsersFields.password] as String,
        imagePath: json[UsersFields.imagePath] as String,
        birthDateD: json[UsersFields.birthDateD] as int,
        birthDateM: json[UsersFields.birthDateM] as int,
        birthDateA: json[UsersFields.birthDateA] as int,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          password == other.password;

  @override
  int get hashCode => name.hashCode ^ password.hashCode;
}
