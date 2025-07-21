import 'package:finapp/domain/entity.dart';
import 'package:flutter/material.dart';

class Category extends Entity {
  final int _id;
  final String description;
  final String _color;

  Category._(this._id, this.description, this._color);

  Category.create(this.description, this._color) : _id = -1;

  Category.load(this._id, this.description, this._color);

  Category.fromMap(Map<String, dynamic> map)
      : _id = map['id'],
        description = map['description'],
        _color = map['color'];

  Map<String, dynamic> toMap() => {'id': id, 'description': description, 'color': _color};

  @override
  int get id => _id;

  Color get color => Color(int.parse(_color));
}
