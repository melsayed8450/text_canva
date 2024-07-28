import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_canva/model/text_item.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<HomeProperty> properties,
    @Default(0) int currentpPropertyIndex,
    @Default(Size(0, 0)) Size selectedTextSize,
    @Default(null) int? selectedTextIndex,
  }) = _HomeState;
}

@freezed
class HomeProperty with _$HomeProperty {
  const factory HomeProperty({
    @Default([]) List<TextItem> textItems,
  }) = _HomeProperty;
}
