// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repository_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepositoryData _$RepositoryDataFromJson(Map<String, dynamic> json) {
  return _RepositoryData.fromJson(json);
}

/// @nodoc
mixin _$RepositoryData {
  int get total_count => throw _privateConstructorUsedError;
  List<RepositoryDataItems> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepositoryDataCopyWith<RepositoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryDataCopyWith<$Res> {
  factory $RepositoryDataCopyWith(
          RepositoryData value, $Res Function(RepositoryData) then) =
      _$RepositoryDataCopyWithImpl<$Res>;
  $Res call({int total_count, List<RepositoryDataItems> items});
}

/// @nodoc
class _$RepositoryDataCopyWithImpl<$Res>
    implements $RepositoryDataCopyWith<$Res> {
  _$RepositoryDataCopyWithImpl(this._value, this._then);

  final RepositoryData _value;
  // ignore: unused_field
  final $Res Function(RepositoryData) _then;

  @override
  $Res call({
    Object? total_count = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      total_count: total_count == freezed
          ? _value.total_count
          : total_count // ignore: cast_nullable_to_non_nullable
              as int,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RepositoryDataItems>,
    ));
  }
}

/// @nodoc
abstract class _$$_RepositoryDataCopyWith<$Res>
    implements $RepositoryDataCopyWith<$Res> {
  factory _$$_RepositoryDataCopyWith(
          _$_RepositoryData value, $Res Function(_$_RepositoryData) then) =
      __$$_RepositoryDataCopyWithImpl<$Res>;
  @override
  $Res call({int total_count, List<RepositoryDataItems> items});
}

/// @nodoc
class __$$_RepositoryDataCopyWithImpl<$Res>
    extends _$RepositoryDataCopyWithImpl<$Res>
    implements _$$_RepositoryDataCopyWith<$Res> {
  __$$_RepositoryDataCopyWithImpl(
      _$_RepositoryData _value, $Res Function(_$_RepositoryData) _then)
      : super(_value, (v) => _then(v as _$_RepositoryData));

  @override
  _$_RepositoryData get _value => super._value as _$_RepositoryData;

  @override
  $Res call({
    Object? total_count = freezed,
    Object? items = freezed,
  }) {
    return _then(_$_RepositoryData(
      total_count: total_count == freezed
          ? _value.total_count
          : total_count // ignore: cast_nullable_to_non_nullable
              as int,
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RepositoryDataItems>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RepositoryData
    with DiagnosticableTreeMixin
    implements _RepositoryData {
  const _$_RepositoryData(
      {required this.total_count,
      required final List<RepositoryDataItems> items})
      : _items = items;

  factory _$_RepositoryData.fromJson(Map<String, dynamic> json) =>
      _$$_RepositoryDataFromJson(json);

  @override
  final int total_count;
  final List<RepositoryDataItems> _items;
  @override
  List<RepositoryDataItems> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RepositoryData(total_count: $total_count, items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RepositoryData'))
      ..add(DiagnosticsProperty('total_count', total_count))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepositoryData &&
            const DeepCollectionEquality()
                .equals(other.total_count, total_count) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total_count),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  _$$_RepositoryDataCopyWith<_$_RepositoryData> get copyWith =>
      __$$_RepositoryDataCopyWithImpl<_$_RepositoryData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepositoryDataToJson(
      this,
    );
  }
}

abstract class _RepositoryData implements RepositoryData {
  const factory _RepositoryData(
      {required final int total_count,
      required final List<RepositoryDataItems> items}) = _$_RepositoryData;

  factory _RepositoryData.fromJson(Map<String, dynamic> json) =
      _$_RepositoryData.fromJson;

  @override
  int get total_count;
  @override
  List<RepositoryDataItems> get items;
  @override
  @JsonKey(ignore: true)
  _$$_RepositoryDataCopyWith<_$_RepositoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

RepositoryDataItems _$RepositoryDataItemsFromJson(Map<String, dynamic> json) {
  return _RepositoryDataItems.fromJson(json);
}

/// @nodoc
mixin _$RepositoryDataItems {
  String get full_name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get avatar_url => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  int get stargazers_count => throw _privateConstructorUsedError;
  int get watchers_count => throw _privateConstructorUsedError;
  int get forks_count => throw _privateConstructorUsedError;
  int get open_issues_count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepositoryDataItemsCopyWith<RepositoryDataItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryDataItemsCopyWith<$Res> {
  factory $RepositoryDataItemsCopyWith(
          RepositoryDataItems value, $Res Function(RepositoryDataItems) then) =
      _$RepositoryDataItemsCopyWithImpl<$Res>;
  $Res call(
      {String full_name,
      String? description,
      String? avatar_url,
      String? language,
      int stargazers_count,
      int watchers_count,
      int forks_count,
      int open_issues_count});
}

/// @nodoc
class _$RepositoryDataItemsCopyWithImpl<$Res>
    implements $RepositoryDataItemsCopyWith<$Res> {
  _$RepositoryDataItemsCopyWithImpl(this._value, this._then);

  final RepositoryDataItems _value;
  // ignore: unused_field
  final $Res Function(RepositoryDataItems) _then;

  @override
  $Res call({
    Object? full_name = freezed,
    Object? description = freezed,
    Object? avatar_url = freezed,
    Object? language = freezed,
    Object? stargazers_count = freezed,
    Object? watchers_count = freezed,
    Object? forks_count = freezed,
    Object? open_issues_count = freezed,
  }) {
    return _then(_value.copyWith(
      full_name: full_name == freezed
          ? _value.full_name
          : full_name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar_url: avatar_url == freezed
          ? _value.avatar_url
          : avatar_url // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      stargazers_count: stargazers_count == freezed
          ? _value.stargazers_count
          : stargazers_count // ignore: cast_nullable_to_non_nullable
              as int,
      watchers_count: watchers_count == freezed
          ? _value.watchers_count
          : watchers_count // ignore: cast_nullable_to_non_nullable
              as int,
      forks_count: forks_count == freezed
          ? _value.forks_count
          : forks_count // ignore: cast_nullable_to_non_nullable
              as int,
      open_issues_count: open_issues_count == freezed
          ? _value.open_issues_count
          : open_issues_count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_RepositoryDataItemsCopyWith<$Res>
    implements $RepositoryDataItemsCopyWith<$Res> {
  factory _$$_RepositoryDataItemsCopyWith(_$_RepositoryDataItems value,
          $Res Function(_$_RepositoryDataItems) then) =
      __$$_RepositoryDataItemsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String full_name,
      String? description,
      String? avatar_url,
      String? language,
      int stargazers_count,
      int watchers_count,
      int forks_count,
      int open_issues_count});
}

/// @nodoc
class __$$_RepositoryDataItemsCopyWithImpl<$Res>
    extends _$RepositoryDataItemsCopyWithImpl<$Res>
    implements _$$_RepositoryDataItemsCopyWith<$Res> {
  __$$_RepositoryDataItemsCopyWithImpl(_$_RepositoryDataItems _value,
      $Res Function(_$_RepositoryDataItems) _then)
      : super(_value, (v) => _then(v as _$_RepositoryDataItems));

  @override
  _$_RepositoryDataItems get _value => super._value as _$_RepositoryDataItems;

  @override
  $Res call({
    Object? full_name = freezed,
    Object? description = freezed,
    Object? avatar_url = freezed,
    Object? language = freezed,
    Object? stargazers_count = freezed,
    Object? watchers_count = freezed,
    Object? forks_count = freezed,
    Object? open_issues_count = freezed,
  }) {
    return _then(_$_RepositoryDataItems(
      full_name: full_name == freezed
          ? _value.full_name
          : full_name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar_url: avatar_url == freezed
          ? _value.avatar_url
          : avatar_url // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      stargazers_count: stargazers_count == freezed
          ? _value.stargazers_count
          : stargazers_count // ignore: cast_nullable_to_non_nullable
              as int,
      watchers_count: watchers_count == freezed
          ? _value.watchers_count
          : watchers_count // ignore: cast_nullable_to_non_nullable
              as int,
      forks_count: forks_count == freezed
          ? _value.forks_count
          : forks_count // ignore: cast_nullable_to_non_nullable
              as int,
      open_issues_count: open_issues_count == freezed
          ? _value.open_issues_count
          : open_issues_count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RepositoryDataItems
    with DiagnosticableTreeMixin
    implements _RepositoryDataItems {
  const _$_RepositoryDataItems(
      {required this.full_name,
      required this.description,
      required this.avatar_url,
      required this.language,
      required this.stargazers_count,
      required this.watchers_count,
      required this.forks_count,
      required this.open_issues_count});

  factory _$_RepositoryDataItems.fromJson(Map<String, dynamic> json) =>
      _$$_RepositoryDataItemsFromJson(json);

  @override
  final String full_name;
  @override
  final String? description;
  @override
  final String? avatar_url;
  @override
  final String? language;
  @override
  final int stargazers_count;
  @override
  final int watchers_count;
  @override
  final int forks_count;
  @override
  final int open_issues_count;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RepositoryDataItems(full_name: $full_name, description: $description, avatar_url: $avatar_url, language: $language, stargazers_count: $stargazers_count, watchers_count: $watchers_count, forks_count: $forks_count, open_issues_count: $open_issues_count)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RepositoryDataItems'))
      ..add(DiagnosticsProperty('full_name', full_name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('avatar_url', avatar_url))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('stargazers_count', stargazers_count))
      ..add(DiagnosticsProperty('watchers_count', watchers_count))
      ..add(DiagnosticsProperty('forks_count', forks_count))
      ..add(DiagnosticsProperty('open_issues_count', open_issues_count));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepositoryDataItems &&
            const DeepCollectionEquality().equals(other.full_name, full_name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.avatar_url, avatar_url) &&
            const DeepCollectionEquality().equals(other.language, language) &&
            const DeepCollectionEquality()
                .equals(other.stargazers_count, stargazers_count) &&
            const DeepCollectionEquality()
                .equals(other.watchers_count, watchers_count) &&
            const DeepCollectionEquality()
                .equals(other.forks_count, forks_count) &&
            const DeepCollectionEquality()
                .equals(other.open_issues_count, open_issues_count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(full_name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(avatar_url),
      const DeepCollectionEquality().hash(language),
      const DeepCollectionEquality().hash(stargazers_count),
      const DeepCollectionEquality().hash(watchers_count),
      const DeepCollectionEquality().hash(forks_count),
      const DeepCollectionEquality().hash(open_issues_count));

  @JsonKey(ignore: true)
  @override
  _$$_RepositoryDataItemsCopyWith<_$_RepositoryDataItems> get copyWith =>
      __$$_RepositoryDataItemsCopyWithImpl<_$_RepositoryDataItems>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepositoryDataItemsToJson(
      this,
    );
  }
}

abstract class _RepositoryDataItems implements RepositoryDataItems {
  const factory _RepositoryDataItems(
      {required final String full_name,
      required final String? description,
      required final String? avatar_url,
      required final String? language,
      required final int stargazers_count,
      required final int watchers_count,
      required final int forks_count,
      required final int open_issues_count}) = _$_RepositoryDataItems;

  factory _RepositoryDataItems.fromJson(Map<String, dynamic> json) =
      _$_RepositoryDataItems.fromJson;

  @override
  String get full_name;
  @override
  String? get description;
  @override
  String? get avatar_url;
  @override
  String? get language;
  @override
  int get stargazers_count;
  @override
  int get watchers_count;
  @override
  int get forks_count;
  @override
  int get open_issues_count;
  @override
  @JsonKey(ignore: true)
  _$$_RepositoryDataItemsCopyWith<_$_RepositoryDataItems> get copyWith =>
      throw _privateConstructorUsedError;
}
