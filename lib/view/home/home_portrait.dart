import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_canva/controller/home_controller/home_cubit.dart';
import 'package:text_canva/controller/home_controller/home_state.dart';
import 'package:text_canva/view/common/fonts_dropdown.dart';
import 'package:text_canva/view/common/measure_size.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class HomePortrait extends StatelessWidget {
  HomePortrait({super.key});

  final OverlayPortalController _dropdownController = OverlayPortalController();
  final ValueNotifier<bool> _isDropdownOpen = ValueNotifier<bool>(false);

  void showDropDown() {
    _dropdownController.show();
    _isDropdownOpen.value = true;
  }

  void hideDropDown() {
    _dropdownController.hide();
    _isDropdownOpen.value = false;
  }

  void changeColor({
    required Color pickerColor,
    required void Function(Color) changeColor,
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                // setState(() => currentColor = pickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideDropDown();
        FocusScope.of(context).unfocus();
        context.read<HomeCubit>().updateSelectedItemIndex(null);
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: _isDropdownOpen,
        builder: (context, isOpen, child) {
          return PopScope(
            canPop: !isOpen,
            onPopInvoked: (val) {
              if (isOpen) {
                hideDropDown();
              }
            },
            child: child!,
          );
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      final cubit = context.read<HomeCubit>();
                      // HomeProperty property =
                      //     state.properties[state.currentpPropertyIndex];
                      return Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              cubit.undo();
                            },
                            child: const Icon(Icons.undo),
                          ),
                          TextButton(
                            onPressed: () {
                              cubit.redo();
                            },
                            child: const Icon(Icons.redo),
                          ),
                        ],
                      );
                    },
                  ),
                  Container(
                    width: 350.sp,
                    height: 350.sp,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        final cubit = context.read<HomeCubit>();
                        HomeProperty property =
                            state.properties[state.currentpPropertyIndex];
                        return Stack(
                          children: property.textItems
                              .asMap()
                              .entries
                              .map<Widget>((textItem) {
                            textItem.value.controller.text =
                                textItem.value.text;
                            return Positioned(
                              left: textItem.value.left,
                              top: textItem.value.top,
                              child: GestureDetector(
                                onPanUpdate: (details) {
                                  cubit.updateSelectedItemIndex(textItem.key);
                                  cubit.updatePanMove(details);
                                },
                                // onPan
                                onTap: () {
                                  if (state.selectedTextIndex != textItem.key) {
                                    FocusScope.of(context).unfocus();
                                  }
                                  cubit.updateSelectedItemIndex(textItem.key);
                                },
                                child: MeasureSize(
                                  onChange: (size) {
                                    cubit.updateSelectedTextSize(size);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: textItem.key ==
                                                state.selectedTextIndex
                                            ? Colors.black
                                            : Colors.transparent,
                                        width: 1.sp,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(10.sp),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: textItem.value.controller,
                                        onTap: () {
                                          cubit.updateSelectedItemIndex(
                                              textItem.key);
                                        },
                                        onChanged: (text) {
                                          cubit.updateTextText(text);
                                        },
                                        style: GoogleFonts.getFont(
                                          textItem.value.style,
                                          color: textItem.value.color,
                                          fontSize: textItem.value.size.sp,
                                        ),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      final cubit = context.read<HomeCubit>();
                      HomeProperty property =
                          state.properties[state.currentpPropertyIndex];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Row(
                          children: [
                            Text('Size'),
                            DropdownMenu<int>(
                              initialSelection: state.selectedTextIndex == null
                                  ? 16
                                  : property
                                      .textItems[state.selectedTextIndex!].size,
                              onSelected: (value) {
                                if (value == null) return;
                                cubit.updateTextSize(value);
                              },
                              dropdownMenuEntries:
                                  List.generate(50, (index) => index + 1).map(
                                (n) {
                                  return DropdownMenuEntry(
                                    value: n,
                                    label: n.toString(),
                                  );
                                },
                              ).toList(),
                            ),
                            const Spacer(),
                            Text('Color'),
                            IconButton(
                              onPressed: () {
                                changeColor(
                                  context: context,
                                  pickerColor: state.selectedTextIndex == null
                                      ? Colors.black
                                      : property
                                          .textItems[state.selectedTextIndex!]
                                          .color,
                                  changeColor: (color) {
                                    cubit.updateTextColor(color);
                                  },
                                );
                              },
                              color: state.selectedTextIndex == null
                                  ? Colors.black
                                  : property.textItems[state.selectedTextIndex!]
                                      .color,
                              icon: Icon(
                                Icons.circle,
                                size: 30.sp,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      final cubit = context.read<HomeCubit>();
                      HomeProperty property =
                          state.properties[state.currentpPropertyIndex];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        child: Row(
                          children: [
                            const Text('Text style'),
                            SizedBox(
                              width: 200.w,
                              child: FontsDropDown(
                                controller: _dropdownController,
                                hideDropDown: hideDropDown,
                                showDropDown: showDropDown,
                                label: 'Fonts',
                                value: state.selectedTextIndex == null
                                    ? ''
                                    : property
                                        .textItems[state.selectedTextIndex!]
                                        .style,
                                onSelected: (font) {
                                  cubit.updateFontStyle(font);
                                },
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                cubit.addTextItem();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text(
                                'Add Text',
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 500,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
