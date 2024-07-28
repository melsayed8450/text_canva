// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  List<HomeProperty> get properties => throw _privateConstructorUsedError;
  int get currentpPropertyIndex => throw _privateConstructorUsedError;
  Size get selectedTextSize => throw _privateConstructorUsedError;
  int? get selectedTextIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<HomeProperty> properties,
      int currentpPropertyIndex,
      Size selectedTextSize,
      int? selectedTextIndex});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? properties = null,
    Object? currentpPropertyIndex = null,
    Object? selectedTextSize = null,
    Object? selectedTextIndex = freezed,
  }) {
    return _then(_value.copyWith(
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<HomeProperty>,
      currentpPropertyIndex: null == currentpPropertyIndex
          ? _value.currentpPropertyIndex
          : currentpPropertyIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedTextSize: null == selectedTextSize
          ? _value.selectedTextSize
          : selectedTextSize // ignore: cast_nullable_to_non_nullable
              as Size,
      selectedTextIndex: freezed == selectedTextIndex
          ? _value.selectedTextIndex
          : selectedTextIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<HomeProperty> properties,
      int currentpPropertyIndex,
      Size selectedTextSize,
      int? selectedTextIndex});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? properties = null,
    Object? currentpPropertyIndex = null,
    Object? selectedTextSize = null,
    Object? selectedTextIndex = freezed,
  }) {
    return _then(_$HomeStateImpl(
      properties: null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<HomeProperty>,
      currentpPropertyIndex: null == currentpPropertyIndex
          ? _value.currentpPropertyIndex
          : currentpPropertyIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedTextSize: null == selectedTextSize
          ? _value.selectedTextSize
          : selectedTextSize // ignore: cast_nullable_to_non_nullable
              as Size,
      selectedTextIndex: freezed == selectedTextIndex
          ? _value.selectedTextIndex
          : selectedTextIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {final List<HomeProperty> properties = const [],
      this.currentpPropertyIndex = 0,
      this.selectedTextSize = const Size(0, 0),
      this.selectedTextIndex = null})
      : _properties = properties;

  final List<HomeProperty> _properties;
  @override
  @JsonKey()
  List<HomeProperty> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @override
  @JsonKey()
  final int currentpPropertyIndex;
  @override
  @JsonKey()
  final Size selectedTextSize;
  @override
  @JsonKey()
  final int? selectedTextIndex;

  @override
  String toString() {
    return 'HomeState(properties: $properties, currentpPropertyIndex: $currentpPropertyIndex, selectedTextSize: $selectedTextSize, selectedTextIndex: $selectedTextIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            (identical(other.currentpPropertyIndex, currentpPropertyIndex) ||
                other.currentpPropertyIndex == currentpPropertyIndex) &&
            (identical(other.selectedTextSize, selectedTextSize) ||
                other.selectedTextSize == selectedTextSize) &&
            (identical(other.selectedTextIndex, selectedTextIndex) ||
                other.selectedTextIndex == selectedTextIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_properties),
      currentpPropertyIndex,
      selectedTextSize,
      selectedTextIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final List<HomeProperty> properties,
      final int currentpPropertyIndex,
      final Size selectedTextSize,
      final int? selectedTextIndex}) = _$HomeStateImpl;

  @override
  List<HomeProperty> get properties;
  @override
  int get currentpPropertyIndex;
  @override
  Size get selectedTextSize;
  @override
  int? get selectedTextIndex;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeProperty {
  List<TextItem> get textItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePropertyCopyWith<HomeProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePropertyCopyWith<$Res> {
  factory $HomePropertyCopyWith(
          HomeProperty value, $Res Function(HomeProperty) then) =
      _$HomePropertyCopyWithImpl<$Res, HomeProperty>;
  @useResult
  $Res call({List<TextItem> textItems});
}

/// @nodoc
class _$HomePropertyCopyWithImpl<$Res, $Val extends HomeProperty>
    implements $HomePropertyCopyWith<$Res> {
  _$HomePropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textItems = null,
  }) {
    return _then(_value.copyWith(
      textItems: null == textItems
          ? _value.textItems
          : textItems // ignore: cast_nullable_to_non_nullable
              as List<TextItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomePropertyImplCopyWith<$Res>
    implements $HomePropertyCopyWith<$Res> {
  factory _$$HomePropertyImplCopyWith(
          _$HomePropertyImpl value, $Res Function(_$HomePropertyImpl) then) =
      __$$HomePropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TextItem> textItems});
}

/// @nodoc
class __$$HomePropertyImplCopyWithImpl<$Res>
    extends _$HomePropertyCopyWithImpl<$Res, _$HomePropertyImpl>
    implements _$$HomePropertyImplCopyWith<$Res> {
  __$$HomePropertyImplCopyWithImpl(
      _$HomePropertyImpl _value, $Res Function(_$HomePropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textItems = null,
  }) {
    return _then(_$HomePropertyImpl(
      textItems: null == textItems
          ? _value._textItems
          : textItems // ignore: cast_nullable_to_non_nullable
              as List<TextItem>,
    ));
  }
}

/// @nodoc

class _$HomePropertyImpl implements _HomeProperty {
  const _$HomePropertyImpl({final List<TextItem> textItems = const []})
      : _textItems = textItems;

  final List<TextItem> _textItems;
  @override
  @JsonKey()
  List<TextItem> get textItems {
    if (_textItems is EqualUnmodifiableListView) return _textItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_textItems);
  }

  @override
  String toString() {
    return 'HomeProperty(textItems: $textItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePropertyImpl &&
            const DeepCollectionEquality()
                .equals(other._textItems, _textItems));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_textItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePropertyImplCopyWith<_$HomePropertyImpl> get copyWith =>
      __$$HomePropertyImplCopyWithImpl<_$HomePropertyImpl>(this, _$identity);
}

abstract class _HomeProperty implements HomeProperty {
  const factory _HomeProperty({final List<TextItem> textItems}) =
      _$HomePropertyImpl;

  @override
  List<TextItem> get textItems;
  @override
  @JsonKey(ignore: true)
  _$$HomePropertyImplCopyWith<_$HomePropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
