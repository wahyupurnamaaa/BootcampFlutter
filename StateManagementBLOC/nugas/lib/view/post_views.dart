import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/post_bloc.dart';
import '../bloc/post_event.dart';
import '../bloc/post_state.dart';
import '../model/post_model.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Posts (BLoC + Dio)'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostInitialState) {
            return const Center(
              child: Text('Tekan tombol refresh untuk mengambil data'),
            );
          }

          if (state is PostLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is PostLoadedState) {
            final List<PostModel> posts = state.posts;
            if (posts.isEmpty) {
              return const Center(
                child: Text('Data kosong'),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                context.read<PostBloc>().add(FetchPostsEvent());
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        post.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(post.body),
                      leading: CircleAvatar(
                        child: Text(post.id.toString()),
                      ),
                    ),
                  );
                },
              ),
            );
          }

          if (state is PostErrorState) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PostBloc>().add(FetchPostsEvent());
                    },
                    child: const Text('Coba Lagi'),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PostBloc>().add(FetchPostsEvent());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}