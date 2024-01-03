import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/main.dart';

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
