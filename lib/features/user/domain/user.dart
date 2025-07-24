class User {
  final String name;

  User._(this.name);

  factory User.create(String name) {
    return User._(
      name,
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User._(map['name']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
