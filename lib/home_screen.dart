import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  // WidgetRef allows a widget to communicate to a provider
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(),
        body: const Column(
          children: [
            Center(
              child: Text(''),
            ),
          ],
        ));
  }
}
