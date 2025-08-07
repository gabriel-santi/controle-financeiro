class User {
  final int id;
  final String name;

  User._(this.id, this.name);

  factory User.create(int id, String name) {
    return User._(-1, name);
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User._(map['id'], map['name']);
  }

  User copyWith({int? id, String? name}) {
    return User._(id ?? this.id, name ?? this.name);
  }
}
