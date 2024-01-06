import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

// This class is immutable
@immutable
class User {
  final String name;
  // final int age;
  final String email;
  const User({
    required this.name,
    // required this.age,
    required this.email,
  });

  User copywith({
    String? name,
    String? email,
  }) {
    return User(name: name ?? this.name, email: email ?? this.email);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      email: map['email'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User{name: $name, email: $email}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && name == other.name && email == other.email;

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}

// We use a provider for UserRepository to have one place to instantiate it
// and pass dependency's to it's constructor.
// Putting UserRepository in a provider also use less memory
// since provider caches the instance of UserRepository and returns it pretty quickly.
// This also make it easier to test UserRepository
final userRepositoryProvider = Provider((ref) => UserRepository());

class UserRepository {
  // Always make http calls inside a separate class instead of directly in the Future provider
  Future<User> fetchUserData(String input) {
    var url = "https://jsonplaceholder.typicode.com/users/$input";
    return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
  }
}

// Extending StateNotifier give the UserNotifier class access to the state variable in order to update the data, ie the User
class UserNotifier extends StateNotifier<User> {
  // UserNotifier(super.state);

  // Instead of receiving the initial state from the StateNotifierProvider,
  // Set the initial state value directly in the StateNotifier class instead of StateNotifierProvider
  UserNotifier() : super(const User(name: 'Christian Tsoungui Nkoulou', email: "tsounguc@gmail.com"));

  void updateName(String newName) {
    state = state.copywith(name: newName);
  }

  void updateAge(String newEmail) {
    state = state.copywith(email: newEmail);
  }
}

// ChangeNotifier and ChangNotifier Provider are part of Provider and was added to Riverpod as a way to transition from Provider to Riverpod
// However it is not advice to change use them when creating an app from scratch with Riverpod
// class UserNotifierChange extends ChangeNotifier {
//   // Unlike the StateNotifier, we have to create the state insid the class
//   User user = const User(name: "", age: 0);
//
//   void updateName(String newName) {
//     user = user.copywith(name: newName);
//     notifyListeners();
//   }
//
//   void updateAge(int newAge) {
//     user = user.copywith(age: newAge);
//     notifyListeners();
//   }
// }
