import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/post_request_repository.dart';
import '../../services/post/post_request_service.dart';

class PostState {
  final String content;
  final List<File> images;
  final List<File> files;
  final String codeLanguage;
  final List<String> tags;
  final String codeSnippet;

  PostState({
    required this.content,
    required this.images,
    required this.files,
    required this.codeLanguage,
    required this.tags,
    required this.codeSnippet,
  });

  PostState copyWith({
    String? content,
    String? codeLanguage,
    List<File>? images,
    List<File>? files,
    List<String>? tags,
    String? codeSnippet,
  }) {
    return PostState(
      content: content ?? this.content,
      images: images ?? this.images,
      codeLanguage: codeLanguage ?? this.codeLanguage,
      files: files ?? this.files,
      tags: tags ?? this.tags,
      codeSnippet: codeSnippet ?? this.codeSnippet,
    );
  }
}

class PostNotifier extends StateNotifier<PostState> {
  PostNotifier()
      : super(PostState(
            content: '', images: [], codeLanguage: '', files: [], tags: [], codeSnippet: ''));

  void updateContent(String newContent) {
    state = state.copyWith(content: newContent);
  }

  void setCodeSnippet(String snippet) {
    state = state.copyWith(codeSnippet: snippet);
  }

  void setCodeLanguage(String codeLanguage) {
    state = state.copyWith(codeLanguage: codeLanguage);
  }

  void addFile(File file) {
    state = state.copyWith(files: [...state.files, file]);
  }

  void addImage(File image) {
    state = state.copyWith(images: [...state.images, image]);
  }

  void addTag(String tag) {
    state = state.copyWith(tags: [...state.tags, tag]);
  }

  void removeTag(String tag) {
    state = state.copyWith(tags: state.tags.where((t) => t != tag).toList());
  }

  void removeFile(File file) {
    state = state.copyWith(files: state.files.where((f) => f != file).toList());
  }

  void removeImage(File image) {
    state = state.copyWith(images: state.images.where((i) => i != image).toList());
  }

  void clear() {
    state =
        PostState(content: '', images: [], files: [], tags: [], codeSnippet: '', codeLanguage: '');
  }
}

final postProvider = StateNotifierProvider<PostNotifier, PostState>((ref) {
  return PostNotifier();
});

// Provider del servicio
final postServiceProvider = Provider<PostService>((ref) {
  return PostService();
});

// Provider del repositorio
final postRepositoryProvider = Provider<PostRepository>((ref) {
  final service = ref.read(postServiceProvider);
  return PostRepository(service);
});
