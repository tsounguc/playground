import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/main.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  onSubmit(WidgetRef ref, String value) {
    // notifier allows us to update the state with the value
    // ref.read(nameProvider.notifier).update((state) => value);

    // notifier allows us to update the state with the value
    // ref.read(userProvider.notifier).updateName(value);

    // With ChangeNotifier and ChangeNotifierProvider variable we don't need .notifier to have access to the methods inside ChangeNotifier
    // ref.read(userChangeNotifierProvider).updateName(value);
  }

  onSubmitAge(WidgetRef ref, String value) {
    // notifier allows us to update the state with the value
    // ref.read(userProvider.notifier).updateAge(int.parse(value));

    // With ChangeNotifier and ChangeNotifierProvider variable we don't need .notifier to have access to the methods inside ChangeNotifier
    // ref.read(userChangeNotifierProvider).updateAge(int.parse(value));
  }

  // WidgetRef allows a widget to communicate to a provider
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // read() if you want to read the data just once. It's generally NOT recommended to use read() inside
    // the build method, especially when you have a stateful wigdet
    // final name = ref.read(nameProvider);

    // watch if you want to keep listening in case there are changes to the data. It's generally recommended
    // to use watch inside a build method
    // final name = ref.watch(nameProvider) ?? '';

    // final user = ref.watch(userProvider);

    // the select method is present on any type of provider And is used to make the build function re-run
    // the entire widget tree only after a specified property of the state Class has changed
    // final userSelect = ref.watch(userProvider.select((value) => value.name));

    // ref.watch() returns an AsyncValue since it's watching a FutureProvider.
    // This approach is a better approach than FutureBuilder since is has less boiler plate
    // return ref.watch(fetchUserProvider).when(
    //   data: (data) {
    //     return Scaffold(
    //         appBar: AppBar(title: Text(data.name)),
    //         body: Column(
    //           children: [
    //             // TextField(onSubmitted: (value) => onSubmit(ref, value)),
    //             // TextField(onSubmitted: (value) => onSubmitAge(ref, value)),
    //             Center(
    //               child: Text(data.email),
    //             ),
    //           ],
    //         ));
    //   },
    //   error: (error, stackTrace) {
    //     return Scaffold(body: Center(child: Text("${stackTrace} ${error.toString()}")));
    //   },
    //   loading: () {
    //     return const Scaffold(body: Center(child: CircularProgressIndicator()));
    //   },
    // );

    return Scaffold(
      body: ref.watch(streamProvider).when(data: (data) {
        return Center(child: Text(data.toString()));
      }, error: (error, stackTrace) {
        return Center(child: Text("$stackTrace ${error.toString()}"));
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
