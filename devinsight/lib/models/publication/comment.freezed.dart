// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  String get id => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get interactionType => throw _privateConstructorUsedError;
  String get commentText => throw _privateConstructorUsedError;
  String get authorProfilePic => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get sentAt =>
      throw _privateConstructorUsedError; // 👈 Aplica el conversor
  bool get isOwnComment => throw _privateConstructorUsedError;

  /// Serializes this Comment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {String id,
      String postId,
      String authorId,
      String interactionType,
      String commentText,
      String authorProfilePic,
      String userName,
      String sentAt,
      bool isOwnComment});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? authorId = null,
    Object? interactionType = null,
    Object? commentText = null,
    Object? authorProfilePic = null,
    Object? userName = null,
    Object? sentAt = null,
    Object? isOwnComment = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      interactionType: null == interactionType
          ? _value.interactionType
          : interactionType // ignore: cast_nullable_to_non_nullable
              as String,
      commentText: null == commentText
          ? _value.commentText
          : commentText // ignore: cast_nullable_to_non_nullable
              as String,
      authorProfilePic: null == authorProfilePic
          ? _value.authorProfilePic
          : authorProfilePic // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as String,
      isOwnComment: null == isOwnComment
          ? _value.isOwnComment
          : isOwnComment // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentImplCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$CommentImplCopyWith(
          _$CommentImpl value, $Res Function(_$CommentImpl) then) =
      __$$CommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String postId,
      String authorId,
      String interactionType,
      String commentText,
      String authorProfilePic,
      String userName,
      String sentAt,
      bool isOwnComment});
}

/// @nodoc
class __$$CommentImplCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$CommentImpl>
    implements _$$CommentImplCopyWith<$Res> {
  __$$CommentImplCopyWithImpl(
      _$CommentImpl _value, $Res Function(_$CommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? authorId = null,
    Object? interactionType = null,
    Object? commentText = null,
    Object? authorProfilePic = null,
    Object? userName = null,
    Object? sentAt = null,
    Object? isOwnComment = null,
  }) {
    return _then(_$CommentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      interactionType: null == interactionType
          ? _value.interactionType
          : interactionType // ignore: cast_nullable_to_non_nullable
              as String,
      commentText: null == commentText
          ? _value.commentText
          : commentText // ignore: cast_nullable_to_non_nullable
              as String,
      authorProfilePic: null == authorProfilePic
          ? _value.authorProfilePic
          : authorProfilePic // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as String,
      isOwnComment: null == isOwnComment
          ? _value.isOwnComment
          : isOwnComment // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentImpl implements _Comment {
  const _$CommentImpl(
      {required this.id,
      required this.postId,
      required this.authorId,
      required this.interactionType,
      required this.commentText,
      required this.authorProfilePic,
      required this.userName,
      required this.sentAt,
      required this.isOwnComment});

  factory _$CommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentImplFromJson(json);

  @override
  final String id;
  @override
  final String postId;
  @override
  final String authorId;
  @override
  final String interactionType;
  @override
  final String commentText;
  @override
  final String authorProfilePic;
  @override
  final String userName;
  @override
  final String sentAt;
// 👈 Aplica el conversor
  @override
  final bool isOwnComment;

  @override
  String toString() {
    return 'Comment(id: $id, postId: $postId, authorId: $authorId, interactionType: $interactionType, commentText: $commentText, authorProfilePic: $authorProfilePic, userName: $userName, sentAt: $sentAt, isOwnComment: $isOwnComment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.interactionType, interactionType) ||
                other.interactionType == interactionType) &&
            (identical(other.commentText, commentText) ||
                other.commentText == commentText) &&
            (identical(other.authorProfilePic, authorProfilePic) ||
                other.authorProfilePic == authorProfilePic) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.isOwnComment, isOwnComment) ||
                other.isOwnComment == isOwnComment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      postId,
      authorId,
      interactionType,
      commentText,
      authorProfilePic,
      userName,
      sentAt,
      isOwnComment);

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      __$$CommentImplCopyWithImpl<_$CommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentImplToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {required final String id,
      required final String postId,
      required final String authorId,
      required final String interactionType,
      required final String commentText,
      required final String authorProfilePic,
      required final String userName,
      required final String sentAt,
      required final bool isOwnComment}) = _$CommentImpl;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$CommentImpl.fromJson;

  @override
  String get id;
  @override
  String get postId;
  @override
  String get authorId;
  @override
  String get interactionType;
  @override
  String get commentText;
  @override
  String get authorProfilePic;
  @override
  String get userName;
  @override
  String get sentAt; // 👈 Aplica el conversor
  @override
  bool get isOwnComment;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
