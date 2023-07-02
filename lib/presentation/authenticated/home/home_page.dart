import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/application/auth/auth_notifier_provider.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),actions: [IconButton(onPressed: (){
        ref.read(authNotifierProvider.notifier).logOut();
      }, icon: Icon(Icons.logout))]),
      body: Text("AuthPage"),);
  }
}
