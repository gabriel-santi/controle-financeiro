import 'package:flutter/material.dart';

class Category {
  final int _id;
  final String description;
  final String _color;

  Category._(this._id, this.description, this._color);

  factory Category.create(String description, String color) {
    return Category._(-1, description, color);
  }

  Category.load(this._id, this.description, this._color);

  Category.fromMap(Map<String, dynamic> map)
      : _id = map['id'],
        description = map['description'],
        _color = map['color'];

  Map<String, dynamic> toMap() => {'id': id, 'description': description, 'color': _color};

  int get id => _id;

  Color get color => Color(int.parse(_color));

  Category copyWith({String? description, String? color, int? id}) {
    return Category.load(
      id ?? _id,
      description ?? this.description,
      color ?? _color,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is Category && runtimeType == other.runtimeType && _id == other._id;

  @override
  int get hashCode => _id.hashCode;
}
