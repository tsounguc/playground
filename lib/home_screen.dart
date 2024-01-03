import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/main.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  onSubmit(WidgetRef ref, String value) {
    // notifier allows us to update the state with the value
    ref.read(nameProvider.notifier).update((state) => value);
  }

  // WidgetRef allows a widget to communicate to a provider
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // read() if you want to read the data just once. It's generally NOT recommended to use read() inside
    // the build method, especially when you have a stateful wigdet
    // final name = ref.read(nameProvider);

    // watch if you want to keep listening in case there are changes to the data. It's generally recommended
    // to use watch inside a build method
    final name = ref.watch(nameProvider) ?? '';
    return Scaffold(
        appBar: AppBar(title: Text(name)),
        body: Column(
          children: [
            TextField(onSubmitted: (value) => onSubmit(ref, value)),
            Center(
              child: Text(name),
            ),
          ],
        ));
  }
}
