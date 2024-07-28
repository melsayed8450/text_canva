import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_item.freezed.dart';

@freezed
class TextItem with _$TextItem {
  const factory TextItem({
    @Default('New Text') String text,
    @Default(20) double left,
    @Default(20) double top,
    @Default(Color(0xFF000000)) Color color,
    @Default(16) int size,
    @Default('Roboto') String style,
    required TextEditingController controller,
  }) = _TextItem;
}
