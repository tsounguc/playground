import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// This class is immutable
@immutable
class User {
  final String name;
  final int age;
  const User({
    required this.name,
    required this.age,
  });

  User copywith({
    String? name,
    int? age,
  }) {
    return User(name: name ?? this.name, age: age ?? this.age);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User{name: $name, age: $age}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && name == other.name && age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

// Extending StateNotifier give the UserNotifier class access to the state variable in order to update the data, ie the User
class UserNotifier extends StateNotifier<User> {
  // UserNotifier(super.state);

  // Instead of receiving the initial state from the StateNotifierProvider,
  // Set the initial state value directly in the StateNotifier class instead of StateNotifierProvider
  UserNotifier() : super(const User(name: 'Christian Tsoungui Nkoulou', age: 27));

  void updateName(String newName) {
    state = state.copywith(name: newName);
  }

  void updateAge(int newAge) {
    state = state.copywith(age: newAge);
  }
}
