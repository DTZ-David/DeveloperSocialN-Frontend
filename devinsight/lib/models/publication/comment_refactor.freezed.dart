// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_refactor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentRefactor _$CommentRefactorFromJson(Map<String, dynamic> json) {
  return _CommentRefactor.fromJson(json);
}

/// @nodoc
mixin _$CommentRefactor {
  String get commentId => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get authorProfilePic => throw _privateConstructorUsedError;
  String get authorName => throw _privateConstructorUsedError;
  DateTime get sentAt => throw _privateConstructorUsedError;

  /// Serializes this CommentRefactor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentRefactor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentRefactorCopyWith<CommentRefactor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentRefactorCopyWith<$Res> {
  factory $CommentRefactorCopyWith(
          CommentRefactor value, $Res Function(CommentRefactor) then) =
      _$CommentRefactorCopyWithImpl<$Res, CommentRefactor>;
  @useResult
  $Res call(
      {String commentId,
      String postId,
      String authorId,
      String type,
      String description,
      String authorProfilePic,
      String authorName,
      DateTime sentAt});
}

/// @nodoc
class _$CommentRefactorCopyWithImpl<$Res, $Val extends CommentRefactor>
    implements $CommentRefactorCopyWith<$Res> {
  _$CommentRefactorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentRefactor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? postId = null,
    Object? authorId = null,
    Object? type = null,
    Object? description = null,
    Object? authorProfilePic = null,
    Object? authorName = null,
    Object? sentAt = null,
  }) {
    return _then(_value.copyWith(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      authorProfilePic: null == authorProfilePic
          ? _value.authorProfilePic
          : authorProfilePic // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentRefactorImplCopyWith<$Res>
    implements $CommentRefactorCopyWith<$Res> {
  factory _$$CommentRefactorImplCopyWith(_$CommentRefactorImpl value,
          $Res Function(_$CommentRefactorImpl) then) =
      __$$CommentRefactorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String commentId,
      String postId,
      String authorId,
      String type,
      String description,
      String authorProfilePic,
      String authorName,
      DateTime sentAt});
}

/// @nodoc
class __$$CommentRefactorImplCopyWithImpl<$Res>
    extends _$CommentRefactorCopyWithImpl<$Res, _$CommentRefactorImpl>
    implements _$$CommentRefactorImplCopyWith<$Res> {
  __$$CommentRefactorImplCopyWithImpl(
      _$CommentRefactorImpl _value, $Res Function(_$CommentRefactorImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentRefactor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? postId = null,
    Object? authorId = null,
    Object? type = null,
    Object? description = null,
    Object? authorProfilePic = null,
    Object? authorName = null,
    Object? sentAt = null,
  }) {
    return _then(_$CommentRefactorImpl(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      authorProfilePic: null == authorProfilePic
          ? _value.authorProfilePic
          : authorProfilePic // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentRefactorImpl implements _CommentRefactor {
  const _$CommentRefactorImpl(
      {required this.commentId,
      required this.postId,
      required this.authorId,
      required this.type,
      required this.description,
      required this.authorProfilePic,
      required this.authorName,
      required this.sentAt});

  factory _$CommentRefactorImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentRefactorImplFromJson(json);

  @override
  final String commentId;
  @override
  final String postId;
  @override
  final String authorId;
  @override
  final String type;
  @override
  final String description;
  @override
  final String authorProfilePic;
  @override
  final String authorName;
  @override
  final DateTime sentAt;

  @override
  String toString() {
    return 'CommentRefactor(commentId: $commentId, postId: $postId, authorId: $authorId, type: $type, description: $description, authorProfilePic: $authorProfilePic, authorName: $authorName, sentAt: $sentAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentRefactorImpl &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.authorProfilePic, authorProfilePic) ||
                other.authorProfilePic == authorProfilePic) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, commentId, postId, authorId,
      type, description, authorProfilePic, authorName, sentAt);

  /// Create a copy of CommentRefactor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentRefactorImplCopyWith<_$CommentRefactorImpl> get copyWith =>
      __$$CommentRefactorImplCopyWithImpl<_$CommentRefactorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentRefactorImplToJson(
      this,
    );
  }
}

abstract class _CommentRefactor implements CommentRefactor {
  const factory _CommentRefactor(
      {required final String commentId,
      required final String postId,
      required final String authorId,
      required final String type,
      required final String description,
      required final String authorProfilePic,
      required final String authorName,
      required final DateTime sentAt}) = _$CommentRefactorImpl;

  factory _CommentRefactor.fromJson(Map<String, dynamic> json) =
      _$CommentRefactorImpl.fromJson;

  @override
  String get commentId;
  @override
  String get postId;
  @override
  String get authorId;
  @override
  String get type;
  @override
  String get description;
  @override
  String get authorProfilePic;
  @override
  String get authorName;
  @override
  DateTime get sentAt;

  /// Create a copy of CommentRefactor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentRefactorImplCopyWith<_$CommentRefactorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
