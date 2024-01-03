import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/main.dart';

class MyWidget extends ConsumerStatefulWidget {
  const MyWidget({super.key});

  @override
  ConsumerState<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<MyWidget> {
  // Use ref.read() in lifecycle state methods or function that you create
  @override
  void initState() {
    final name = ref.read(nameProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Use ref.watch inside the build method
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Column(
        children: [
          Center(
            child: Text(name),
          )
        ],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // WidgetRef allows a widget to communicate to a provider
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Consumer(builder: (context, ref, child) {
          // read() if you want to read the data just once. It's generally recommended not to use read() inside
          // the build method when you have a stateful wiget
          // final name = ref.read(nameProvider);

          // watch if you want to keep listening in case there are changes to the data. It's generally recommended
          // to use watch inside a build method
          final name = ref.watch(nameProvider);

          return Column(
            children: [
              Center(
                child: Text(name),
              ),
            ],
          );
        }));
  }
}
