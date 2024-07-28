import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_canva/controller/home_controller/home_state.dart';
import 'package:text_canva/model/text_item.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          const HomeState(
            selectedHomeProperty: HomeProperty(),
          ),
        ) {
    init();
  }
  void init() {
    updateHomeProperty(
      const HomeProperty(),
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
    TextItem currentItem =
        state.selectedHomeProperty.textItems[state.selectedTextIndex!];
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

  void updateTempPanMove(DragUpdateDetails details) {
    if (state.selectedTextIndex == null) return;
    TextItem currentItem =
        state.selectedHomeProperty.textItems[state.selectedTextIndex!];
    updateTempTextItem(
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
    TextItem currentItem =
        state.selectedHomeProperty.textItems[state.selectedTextIndex!];
    updateTextItem(
      state.selectedTextIndex!,
      currentItem.copyWith(
        style: style,
      ),
    );
  }

  void updateSelectedTextSize(Size size) {
    emit(state.copyWith(selectedTextSize: size));
  }

  void addTextItem() {
    updateHomeProperty(
      state.selectedHomeProperty.copyWith(
        textItems: [
          ...state.selectedHomeProperty.textItems,
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
        selectedTextIndex: state.selectedHomeProperty.textItems.length - 1,
      ),
    );
  }

  void updateTextColor(Color color) {
    if (state.selectedTextIndex == null) return;
    TextItem currentItem =
        state.selectedHomeProperty.textItems[state.selectedTextIndex!];
    updateTextItem(
      state.selectedTextIndex!,
      currentItem.copyWith(
        color: color,
      ),
    );
  }

  void updateTextSize(int size) {
    if (state.selectedTextIndex == null) return;
    TextItem currentItem =
        state.selectedHomeProperty.textItems[state.selectedTextIndex!];
    updateTextItem(
      state.selectedTextIndex!,
      currentItem.copyWith(
        size: size,
      ),
    );
  }

  void updateTextText(String text) {
    if (state.selectedTextIndex == null) return;
    TextItem currentItem =
        state.selectedHomeProperty.textItems[state.selectedTextIndex!];
    updateTextItem(
      state.selectedTextIndex!,
      currentItem.copyWith(
        text: text,
      ),
    );
  }

  void updateTextItem(int index, TextItem item) {
    final updatedItems =
        List<TextItem>.from(state.selectedHomeProperty.textItems);
    if (index >= 0 && index < updatedItems.length) {
      updatedItems[index] = item;
      updateHomeProperty(
          state.selectedHomeProperty.copyWith(textItems: updatedItems));
    }
  }

  void updateTempTextItem(int index, TextItem item) {
    final updatedItems =
        List<TextItem>.from(state.selectedHomeProperty.textItems);
    if (index >= 0 && index < updatedItems.length) {
      updatedItems[index] = item;
      updateTempHomeProperty(
          state.selectedHomeProperty.copyWith(textItems: updatedItems));
    }
  }

  void updateHomeProperty(HomeProperty property) {
    emit(
      state.copyWith(
        properties: [
          ...state.properties.take(state.currentpPropertyIndex + 1),
          property,
        ],
        currentpPropertyIndex: state.currentpPropertyIndex + 1,
        selectedHomeProperty: property,
      ),
    );
  }

  void updateTempHomeProperty(HomeProperty property) {
    emit(
      state.copyWith(
        selectedHomeProperty: property,
      ),
    );
  }

  void undo() {
    if (state.currentpPropertyIndex <= 0) return;
    emit(
      state.copyWith(
        currentpPropertyIndex: state.currentpPropertyIndex - 1,
        selectedHomeProperty: state.properties[state.currentpPropertyIndex - 1],
        selectedTextIndex: null,
      ),
    );
  }

  void redo() {
    if (state.currentpPropertyIndex + 1 >= state.properties.length) return;
    emit(
      state.copyWith(
        currentpPropertyIndex: state.currentpPropertyIndex + 1,
        selectedHomeProperty: state.properties[state.currentpPropertyIndex + 1],
        selectedTextIndex: null,
      ),
    );
  }
}
