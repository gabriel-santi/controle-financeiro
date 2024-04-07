import 'package:finapp/domain/entity.dart';

class Category extends Entity {
  final int _id;
  final String description;
  final String color;

  Category._(this._id, this.description, this.color);

  Category.create(this.description, this.color) : _id = -1;

  Category.load(this._id, this.description, this.color);

  Category.fromMap(Map<String, dynamic> map)
      : _id = map['id'],
        description = map['description'],
        color = map['color'];

  Map<String, dynamic> toMap() => {'id': id, 'description': description, 'color': color};

  @override
  int get id => _id;
}
