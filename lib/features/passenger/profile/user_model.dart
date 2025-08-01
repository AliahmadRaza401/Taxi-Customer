class UserModel {
  final String name;
  final String mobile;
  final String email;
  final String password;

  UserModel({
    required this.name,
    required this.mobile,
    required this.email,
    required this.password,
  });

  UserModel copyWith({
    String? name,
    String? mobile,
    String? email,
    String? password,
  }) {
    return UserModel(
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

