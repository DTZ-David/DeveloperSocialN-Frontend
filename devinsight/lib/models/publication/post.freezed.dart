// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get authorId => throw _privateConstructorUsedError;
  String get codeSnippet => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get profilePicture => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<Comment> get comments => throw _privateConstructorUsedError;
  List<Reaction> get reactions => throw _privateConstructorUsedError;

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String authorId,
      String codeSnippet,
      String description,
      String userName,
      String profilePicture,
      int likes,
      List<String> tags,
      List<Comment> comments,
      List<Reaction> reactions});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorId = null,
    Object? codeSnippet = null,
    Object? description = null,
    Object? userName = null,
    Object? profilePicture = null,
    Object? likes = null,
    Object? tags = null,
    Object? comments = null,
    Object? reactions = null,
  }) {
    return _then(_value.copyWith(
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      codeSnippet: null == codeSnippet
          ? _value.codeSnippet
          : codeSnippet // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      reactions: null == reactions
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<Reaction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String authorId,
      String codeSnippet,
      String description,
      String userName,
      String profilePicture,
      int likes,
      List<String> tags,
      List<Comment> comments,
      List<Reaction> reactions});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorId = null,
    Object? codeSnippet = null,
    Object? description = null,
    Object? userName = null,
    Object? profilePicture = null,
    Object? likes = null,
    Object? tags = null,
    Object? comments = null,
    Object? reactions = null,
  }) {
    return _then(_$PostImpl(
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      codeSnippet: null == codeSnippet
          ? _value.codeSnippet
          : codeSnippet // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      reactions: null == reactions
          ? _value._reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<Reaction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {required this.authorId,
      required this.codeSnippet,
      required this.description,
      required this.userName,
      required this.profilePicture,
      required this.likes,
      required final List<String> tags,
      final List<Comment> comments = const [],
      final List<Reaction> reactions = const []})
      : _tags = tags,
        _comments = comments,
        _reactions = reactions;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  final String authorId;
  @override
  final String codeSnippet;
  @override
  final String description;
  @override
  final String userName;
  @override
  final String profilePicture;
  @override
  final int likes;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<Comment> _comments;
  @override
  @JsonKey()
  List<Comment> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  final List<Reaction> _reactions;
  @override
  @JsonKey()
  List<Reaction> get reactions {
    if (_reactions is EqualUnmodifiableListView) return _reactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reactions);
  }

  @override
  String toString() {
    return 'Post(authorId: $authorId, codeSnippet: $codeSnippet, description: $description, userName: $userName, profilePicture: $profilePicture, likes: $likes, tags: $tags, comments: $comments, reactions: $reactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.codeSnippet, codeSnippet) ||
                other.codeSnippet == codeSnippet) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            const DeepCollectionEquality()
                .equals(other._reactions, _reactions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      authorId,
      codeSnippet,
      description,
      userName,
      profilePicture,
      likes,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_comments),
      const DeepCollectionEquality().hash(_reactions));

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {required final String authorId,
      required final String codeSnippet,
      required final String description,
      required final String userName,
      required final String profilePicture,
      required final int likes,
      required final List<String> tags,
      final List<Comment> comments,
      final List<Reaction> reactions}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  String get authorId;
  @override
  String get codeSnippet;
  @override
  String get description;
  @override
  String get userName;
  @override
  String get profilePicture;
  @override
  int get likes;
  @override
  List<String> get tags;
  @override
  List<Comment> get comments;
  @override
  List<Reaction> get reactions;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
