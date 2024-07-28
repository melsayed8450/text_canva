import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_canva/controller/home_controller/home_state.dart';
import 'package:text_canva/model/text_item.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()) {
    init();
  }
  void init() {
    updateHomeProperty(
      HomeProperty(
        textItems: [
          TextItem(
            controller: TextEditingController(text: 'New Text'),
            left: 120.sp,
            top: 150.sp,
          ),
        ],
      ),
    );
  }

  void updateSelectedItemIndex(int? index) {
    emit(
      state.copyWith(
        selectedTextIndex: index,
      ),
    );
  }

  void updatePanMove(DragUpdateDetails details) {
    if (state.selectedTextIndex == null) return;
    HomeProperty property = state.properties[state.currentpPropertyIndex];
    TextItem currentItem = property.textItems[state.selectedTextIndex!];
    updateTextItem(
      state.selectedTextIndex!,
      currentItem.copyWith(
        left: max(
          0,
          min(
            350.sp - state.selectedTextSize.width - 2.sp,
            currentItem.left + details.delta.dx,
          ),
        ),
        top: max(
          0,
          min(
            350.sp - state.selectedTextSize.height - 2.sp,
            currentItem.top + details.delta.dy,
          ),
        ),
      ),
    );
  }

  void updateFontStyle(String style) {
    if (state.selectedTextIndex == null) return;
    HomeProperty property = state.properties[state.currentpPropertyIndex];
    TextItem currentItem = property.textItems[state.selectedTextIndex!];
    updateTextItem(
      state.selectedTextIndex!,
      currentItem.copyWith(
        style: style,
      ),
    );
  }

  void updateSelectedTextSize(Size size) {
    emit(state.copyWith(selectedTextSize: size));
    // emit(state.copyWith(selectedTextSize: size));
  }

  void addTextItem() {
    HomeProperty property = state.properties[state.currentpPropertyIndex];
    updateHomeProperty(
      property.copyWith(
        textItems: [
          ...property.textItems,
          TextItem(
            left: 120.sp,
            top: 150.sp,
            controller: TextEditingController(
              text: 'New Text',
            ),
          ),
        ],
      ),
    );
    emit(
      state.copyWith(
        selectedTextIndex: property.textItems.length,
      ),
    );
  }

  void updateTextColor(Color color) {
    if (state.selectedTextIndex == null) return;
    HomeProperty property = state.properties[state.currentpPropertyIndex];
    TextItem currentItem = property.textItems[state.selectedTextIndex!];
    updateTextItem(
      state.selectedTextIndex!,
      currentItem.copyWith(
        color: color,
      ),
    );
  }

  void updateTextSize(int size) {
    if (state.selectedTextIndex == null) return;
    HomeProperty property = state.properties[state.currentpPropertyIndex];
    TextItem currentItem = property.textItems[state.selectedTextIndex!];
    updateTextItem(
      state.selectedTextIndex!,
      currentItem.copyWith(
        size: size,
      ),
    );
  }

  void updateTextText(String text) {
    if (state.selectedTextIndex == null) return;
    HomeProperty property = state.properties[state.currentpPropertyIndex];
    TextItem currentItem = property.textItems[state.selectedTextIndex!];
    updateTextItem(
      state.selectedTextIndex!,
      currentItem.copyWith(
        text: text,
      ),
    );
  }

  void updateTextItem(int index, TextItem item) {
    HomeProperty property = state.properties[state.currentpPropertyIndex];
    final updatedItems = List<TextItem>.from(property.textItems);
    if (index >= 0 && index < updatedItems.length) {
      updatedItems[index] = item;
      updateHomeProperty(property.copyWith(textItems: updatedItems));
    }
  }

  void updateHomeProperty(HomeProperty property) {
    emit(
      state.copyWith(
        properties: [
          ...state.properties.getRange(0, state.currentpPropertyIndex + 1),
          property,
        ],
        currentpPropertyIndex: state.currentpPropertyIndex + 1,
      ),
    );
  }
  // void updateTempHomeProperty(HomeProperty property) {
  //   emit(
  //     state.copyWith(
  //       properties: [
  //         ...state.properties.getRange(0, state.currentpPropertyIndex + 1),
  //         property,
  //       ],
  //       currentpPropertyIndex: state.currentpPropertyIndex + 1,
  //     ),
  //   );
  // }

  void undo() {
    if (state.currentpPropertyIndex <= 0) return;
    emit(
        state.copyWith(currentpPropertyIndex: state.currentpPropertyIndex - 1));
  }

  void redo() {
    if (state.currentpPropertyIndex >= state.properties.length) return;
    emit(
        state.copyWith(currentpPropertyIndex: state.currentpPropertyIndex + 1));
  }
}
