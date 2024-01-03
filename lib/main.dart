import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_screen.dart';

// Provider is a read only widget and is immutable
// ProviderRef allows a provider to communicate to other providers
// final nameProvider = Provider<String>((ProviderRef ref) => 'Christian Tsoungui Nkoulou');

// StateProvider is kinda like an upgrade to Provider; With StateProvider you can update the value from outside.
// like Provider, it's immutable
final nameProvider = StateProvider<String?>((StateProviderRef ref) => null);

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
