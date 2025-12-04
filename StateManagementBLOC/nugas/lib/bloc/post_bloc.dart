import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_event.dart';
import 'post_state.dart';
import '../controller/post_controller.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostController postController;

  PostBloc(this.postController) : super(PostInitialState()) {
    on<FetchPostsEvent>(_onFetchPosts);
  }

  Future<void> _onFetchPosts(
    FetchPostsEvent event,
    Emitter<PostState> emit,
  ) async {
    emit(PostLoadingState());
    try {
      final posts = await postController.getPosts();
      emit(PostLoadedState(posts: posts));
    } catch (e) {
      emit(PostErrorState(message: e.toString()));
    }
  }
}