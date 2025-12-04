import 'package:equatable/equatable.dart';
import '../model/post_model.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object?> get props => [];
}

class PostInitialState extends PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<PostModel> posts;

  const PostLoadedState({required this.posts});

  @override
  List<Object?> get props => [posts];
}

class PostErrorState extends PostState {
  final String message;

  const PostErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}