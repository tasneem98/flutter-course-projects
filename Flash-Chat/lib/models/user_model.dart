class UserModel {
  final Name name;
  final String avatarUrl;
  final DateTime lastActive;

  UserModel(
      {required this.name, required this.avatarUrl, required this.lastActive});
}

class Name {
  final String firstName;
  final String lastName;

  Name({required this.firstName, required this.lastName});

  String get fullName => '$firstName $lastName';
}
