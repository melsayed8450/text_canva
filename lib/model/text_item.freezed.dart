// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TextItem {
  String get text => throw _privateConstructorUsedError;
  double get left => throw _privateConstructorUsedError;
  double get top => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String get style => throw _privateConstructorUsedError;
  TextEditingController get controller => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextItemCopyWith<TextItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextItemCopyWith<$Res> {
  factory $TextItemCopyWith(TextItem value, $Res Function(TextItem) then) =
      _$TextItemCopyWithImpl<$Res, TextItem>;
  @useResult
  $Res call(
      {String text,
      double left,
      double top,
      Color color,
      int size,
      String style,
      TextEditingController controller});
}

/// @nodoc
class _$TextItemCopyWithImpl<$Res, $Val extends TextItem>
    implements $TextItemCopyWith<$Res> {
  _$TextItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? left = null,
    Object? top = null,
    Object? color = null,
    Object? size = null,
    Object? style = null,
    Object? controller = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as double,
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as String,
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextItemImplCopyWith<$Res>
    implements $TextItemCopyWith<$Res> {
  factory _$$TextItemImplCopyWith(
          _$TextItemImpl value, $Res Function(_$TextItemImpl) then) =
      __$$TextItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      double left,
      double top,
      Color color,
      int size,
      String style,
      TextEditingController controller});
}

/// @nodoc
class __$$TextItemImplCopyWithImpl<$Res>
    extends _$TextItemCopyWithImpl<$Res, _$TextItemImpl>
    implements _$$TextItemImplCopyWith<$Res> {
  __$$TextItemImplCopyWithImpl(
      _$TextItemImpl _value, $Res Function(_$TextItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? left = null,
    Object? top = null,
    Object? color = null,
    Object? size = null,
    Object? style = null,
    Object? controller = null,
  }) {
    return _then(_$TextItemImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as double,
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as String,
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$TextItemImpl implements _TextItem {
  const _$TextItemImpl(
      {this.text = 'New Text',
      this.left = 20,
      this.top = 20,
      this.color = const Color(0xFF000000),
      this.size = 16,
      this.style = 'Roboto',
      required this.controller});

  @override
  @JsonKey()
  final String text;
  @override
  @JsonKey()
  final double left;
  @override
  @JsonKey()
  final double top;
  @override
  @JsonKey()
  final Color color;
  @override
  @JsonKey()
  final int size;
  @override
  @JsonKey()
  final String style;
  @override
  final TextEditingController controller;

  @override
  String toString() {
    return 'TextItem(text: $text, left: $left, top: $top, color: $color, size: $size, style: $style, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextItemImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.left, left) || other.left == left) &&
            (identical(other.top, top) || other.top == top) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, text, left, top, color, size, style, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextItemImplCopyWith<_$TextItemImpl> get copyWith =>
      __$$TextItemImplCopyWithImpl<_$TextItemImpl>(this, _$identity);
}

abstract class _TextItem implements TextItem {
  const factory _TextItem(
      {final String text,
      final double left,
      final double top,
      final Color color,
      final int size,
      final String style,
      required final TextEditingController controller}) = _$TextItemImpl;

  @override
  String get text;
  @override
  double get left;
  @override
  double get top;
  @override
  Color get color;
  @override
  int get size;
  @override
  String get style;
  @override
  TextEditingController get controller;
  @override
  @JsonKey(ignore: true)
  _$$TextItemImplCopyWith<_$TextItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
