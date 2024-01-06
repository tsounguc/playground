import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/logger_riverpod.dart';
import 'package:playground/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'home_screen.dart';
import 'package:http/http.dart' as http;
part 'main.g.dart';

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
// final userProvider = StateNotifierProvider<UserNotifier, User>(
//     // (ref) => UserNotifier(const User(name: 'Christian Tsoungui Nkoulou', age: 27)));
//
//     // Set the initial state value directly in the StateNotifier class instead of sending it from StateNotifierProvider
//     (ref) => UserNotifier());

// ChangeNotifierProvider is the only Provider that is mutable,
// which means we can change the value of the state object outside of the class
// final userChangeNotifierProvider = ChangeNotifierProvider((ref) => UserNotifierChange());

@riverpod
Future<User> fetchUser(FetchUserRef ref, {required String input, required int someValue, required secondValue}) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData(input);
}
// The FutureProvider fetchUserProvider is watching the Provider userRepositoryProvider
// The family modifier can only have one extra parameter passed in
// the autoDispose modifier avoids memory leaks and disposes the provider and state when it's not in use
// final fetchUserProvider =
//     FutureProvider.family.autoDispose((AutoDisposeFutureProviderRef<Object?> ref, String input) {
//   // keepAlive() comes with autoDispose() modifier and it allows us to preserve the state of the provider
//   ref.keepAlive();
//   final userRepository = ref.watch(userRepositoryProvider);
//   return userRepository.fetchUserData(input);
// });

final streamProvider = StreamProvider((ref) async* {
  // You can use ref.onDispose() to dispose streams subscriptions
  // or other disposable thing without the .autoDispose() modifier
  ref.onDispose(() {});

  // You can use ref.onCancel() when your provider goes into a post state,
  // which means it's temporarily not being used or gets disposed
  ref.onCancel(() {});

  // You can use ref.onResume() after the provider has been in the cancel state and it's come back
  ref.onResume(() {});

  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});

void main() {
  runApp(
    ProviderScope(
      observers: [LoggerRiverpod()],
      child: const MyApp(),
    ),
  );
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

// Limitations of Riverpod:
// 1. There are 6 providers. This can be confusing and inconvenient to chose which one to use
// 2. You have use ConsumerStatefulWidget or ConsumerWidget in order to use the WidgetRef or ProviderRef variables in the screens/pages using the providers
// 3. When using the .family() modifier from a provider you can not pass more than one parameter.
//    Allowing this modifier to have more than one parameter would allow the use of named parameters
