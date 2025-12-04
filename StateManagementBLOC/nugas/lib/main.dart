import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controller/post_controller.dart';
import 'bloc/post_bloc.dart';
import 'bloc/post_event.dart';
import 'view/post_views.dart';

void main() {
  final postController = PostController();
  runApp(MyApp(postController: postController));
}

class MyApp extends StatelessWidget {
  final PostController postController;

  const MyApp({super.key, required this.postController});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas BLoC + Dio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => PostBloc(postController)..add(FetchPostsEvent()),
        child: const PostView(),
      ),
    );
  }
}