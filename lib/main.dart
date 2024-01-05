import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/user.dart';

import 'home_screen.dart';

// Provider is a read only widget and is immutable
// ProviderRef allows a provider to communicate to other providers
// final nameProvider = Provider<String>((ProviderRef ref) => 'Christian Tsoungui Nkoulou');

// StateProvider is kinda like an upgrade to Provider; With StateProvider you can update the value from outside.
// like Provider, it's immutable. It's used for simple value like a string, boolean, integer, double, or float value
// final nameProvider = StateProvider<String?>((StateProviderRef ref) => null);

// For complex values like values maps or inside a class, we use the StateNotifier and StateNotifierProvider.
// In order to have code that's robust and easier to test, we generally use this approach instead of StateProvider
// Because it provides one place to have all the business logic
// Pass to StateNotifierProvider the StateNotifier class and State class as Generic types in;
// In our case that's UserNotifier and User.
// Not doing this will result in a variable of type Object? when trying to access state
final userProvider = StateNotifierProvider<UserNotifier, User>(
    // (ref) => UserNotifier(const User(name: 'Christian Tsoungui Nkoulou', age: 27)));

    // Set the initial state value directly in the StateNotifier class instead of sending it from StateNotifierProvider
    (ref) => UserNotifier());

// ChangeNotifierProvider is the only Provider that is mutable,
// which means we can change the value of the state object outside of the class
final userChangeNotifierProvider = ChangeNotifierProvider((ref) => UserNotifierChange());

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Riverpod Tutorial',
      home: MyHomePage(),
    );
  }
}
