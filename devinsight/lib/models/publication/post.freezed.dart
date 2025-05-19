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
  String get id => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get fechaPublicacion => throw _privateConstructorUsedError;
  String get codeLanguage => throw _privateConstructorUsedError;
  String get codeSnippet => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  int get shares =>
      throw _privateConstructorUsedError; // Como no viene, le damos 0 por defecto
  String get userName => throw _privateConstructorUsedError;
  String get profilePicture => throw _privateConstructorUsedError;
  Map<String, int> get reactions => throw _privateConstructorUsedError;

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
      {String id,
      String authorId,
      String fechaPublicacion,
      String codeLanguage,
      String codeSnippet,
      String description,
      List<String> tags,
      int shares,
      String userName,
      String profilePicture,
      Map<String, int> reactions});
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
    Object? id = null,
    Object? authorId = null,
    Object? fechaPublicacion = null,
    Object? codeLanguage = null,
    Object? codeSnippet = null,
    Object? description = null,
    Object? tags = null,
    Object? shares = null,
    Object? userName = null,
    Object? profilePicture = null,
    Object? reactions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      fechaPublicacion: null == fechaPublicacion
          ? _value.fechaPublicacion
          : fechaPublicacion // ignore: cast_nullable_to_non_nullable
              as String,
      codeLanguage: null == codeLanguage
          ? _value.codeLanguage
          : codeLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      codeSnippet: null == codeSnippet
          ? _value.codeSnippet
          : codeSnippet // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shares: null == shares
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      reactions: null == reactions
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
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
      {String id,
      String authorId,
      String fechaPublicacion,
      String codeLanguage,
      String codeSnippet,
      String description,
      List<String> tags,
      int shares,
      String userName,
      String profilePicture,
      Map<String, int> reactions});
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
    Object? id = null,
    Object? authorId = null,
    Object? fechaPublicacion = null,
    Object? codeLanguage = null,
    Object? codeSnippet = null,
    Object? description = null,
    Object? tags = null,
    Object? shares = null,
    Object? userName = null,
    Object? profilePicture = null,
    Object? reactions = null,
  }) {
    return _then(_$PostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      fechaPublicacion: null == fechaPublicacion
          ? _value.fechaPublicacion
          : fechaPublicacion // ignore: cast_nullable_to_non_nullable
              as String,
      codeLanguage: null == codeLanguage
          ? _value.codeLanguage
          : codeLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      codeSnippet: null == codeSnippet
          ? _value.codeSnippet
          : codeSnippet // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shares: null == shares
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      reactions: null == reactions
          ? _value._reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {required this.id,
      required this.authorId,
      required this.fechaPublicacion,
      required this.codeLanguage,
      required this.codeSnippet,
      required this.description,
      required final List<String> tags,
      this.shares = 0,
      required this.userName,
      required this.profilePicture,
      final Map<String, int> reactions = const {}})
      : _tags = tags,
        _reactions = reactions;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  final String id;
  @override
  final String authorId;
  @override
  final String fechaPublicacion;
  @override
  final String codeLanguage;
  @override
  final String codeSnippet;
  @override
  final String description;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final int shares;
// Como no viene, le damos 0 por defecto
  @override
  final String userName;
  @override
  final String profilePicture;
  final Map<String, int> _reactions;
  @override
  @JsonKey()
  Map<String, int> get reactions {
    if (_reactions is EqualUnmodifiableMapView) return _reactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_reactions);
  }

  @override
  String toString() {
    return 'Post(id: $id, authorId: $authorId, fechaPublicacion: $fechaPublicacion, codeLanguage: $codeLanguage, codeSnippet: $codeSnippet, description: $description, tags: $tags, shares: $shares, userName: $userName, profilePicture: $profilePicture, reactions: $reactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.fechaPublicacion, fechaPublicacion) ||
                other.fechaPublicacion == fechaPublicacion) &&
            (identical(other.codeLanguage, codeLanguage) ||
                other.codeLanguage == codeLanguage) &&
            (identical(other.codeSnippet, codeSnippet) ||
                other.codeSnippet == codeSnippet) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.shares, shares) || other.shares == shares) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            const DeepCollectionEquality()
                .equals(other._reactions, _reactions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      authorId,
      fechaPublicacion,
      codeLanguage,
      codeSnippet,
      description,
      const DeepCollectionEquality().hash(_tags),
      shares,
      userName,
      profilePicture,
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
      {required final String id,
      required final String authorId,
      required final String fechaPublicacion,
      required final String codeLanguage,
      required final String codeSnippet,
      required final String description,
      required final List<String> tags,
      final int shares,
      required final String userName,
      required final String profilePicture,
      final Map<String, int> reactions}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  String get id;
  @override
  String get authorId;
  @override
  String get fechaPublicacion;
  @override
  String get codeLanguage;
  @override
  String get codeSnippet;
  @override
  String get description;
  @override
  List<String> get tags;
  @override
  int get shares; // Como no viene, le damos 0 por defecto
  @override
  String get userName;
  @override
  String get profilePicture;
  @override
  Map<String, int> get reactions;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
