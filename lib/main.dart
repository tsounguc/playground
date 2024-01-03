import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_screen.dart';

// Provider is a read only widget and is immutable
// ProviderRef allows a provider to communicate to other providers
final nameProvider = Provider<String>((ProviderRef ref) => 'Christian Tsoungui Nkoulou');

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
