// providers/post_state.dart
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostState {
  final String content;
  final List<File> images;
  final List<File> files;
  final List<String> tags;

  PostState({
    this.content = '',
    this.images = const [],
    this.files = const [],
    this.tags = const [],
  });

  PostState copyWith({
    String? content,
    List<File>? images,
    List<File>? files,
    List<String>? tags,
  }) {
    return PostState(
      content: content ?? this.content,
      images: images ?? this.images,
      files: files ?? this.files,
      tags: tags ?? this.tags,
    );
  }
}

class PostNotifier extends StateNotifier<PostState> {
  PostNotifier() : super(PostState());

  void updateContent(String value) {
    state = state.copyWith(content: value);
  }

  void addImage(File image) {
    state = state.copyWith(images: [...state.images, image]);
  }

  void removeImage(File image) {
    state =
        state.copyWith(images: state.images.where((i) => i != image).toList());
  }

  void addFile(File file) {
    state = state.copyWith(files: [...state.files, file]);
  }

  void removeFile(File file) {
    state = state.copyWith(files: state.files.where((f) => f != file).toList());
  }

  void addTag(String tag) {
    state = state.copyWith(tags: [...state.tags, tag]);
  }

  void clear() {
    state = PostState();
  }

  void removeTag(String tag) {
    state = state.copyWith(
      tags: state.tags.where((t) => t != tag).toList(),
    );
  }
}

final postProvider = StateNotifierProvider<PostNotifier, PostState>((ref) {
  return PostNotifier();
});
