import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_canva/controller/home_controller/home_cubit.dart';
import 'package:text_canva/controller/home_controller/home_state.dart';
import 'package:text_canva/utils/app_colors.dart';
import 'package:text_canva/view/common/fonts_dropdown.dart';
import 'package:text_canva/view/common/measure_size.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class HomePortrait extends StatelessWidget {
  HomePortrait({super.key});

  final OverlayPortalController _dropdownController = OverlayPortalController();
  final ValueNotifier<bool> _isDropdownOpen = ValueNotifier<bool>(false);
  final FixedExtentScrollController scrollController =
      FixedExtentScrollController(initialItem: 15);
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
          title: Text(
            'Pick a Color',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.black,
              ),
              child: Text(
                'Done',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
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
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 15.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      final cubit = context.read<HomeCubit>();
                      return Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            radius: 30.r,
                            child: IconButton(
                              onPressed: () {
                                cubit.undo();
                              },
                              icon: const Icon(
                                Icons.undo,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            radius: 30.r,
                            child: IconButton(
                              onPressed: () {
                                cubit.redo();
                              },
                              icon: const Icon(
                                Icons.redo,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(15.r),
                        dashPattern: const [10, 10],
                        color: AppColors.primaryColor,
                        strokeWidth: 2,
                        child: Container(
                          width: 350.sp,
                          height: 350.sp,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: BlocBuilder<HomeCubit, HomeState>(
                            builder: (context, state) {
                              final cubit = context.read<HomeCubit>();
                              HomeProperty property =
                                  state.selectedHomeProperty;
                              DragUpdateDetails? updateDetails;
                              if (property.textItems.isEmpty) {
                                return GestureDetector(
                                  onTap: () {
                                    cubit.addTextItem();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Tap to add text or use the \'Add Text\' button below',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Text(
                                        'Drag to position text',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          cubit.addTextItem();
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          foregroundColor: Colors.black,
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10.h,
                                            horizontal: 20.w,
                                          ),
                                        ),
                                        child: Text(
                                          'Add Text',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }

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
                                        cubit.updateSelectedItemIndex(
                                            textItem.key);
                                        cubit.updateTempPanMove(details);
                                        updateDetails = details;
                                      },
                                      onPanEnd: (details) {
                                        if (updateDetails == null) return;
                                        cubit.updatePanMove(updateDetails!);
                                      },
                                      onTap: () {
                                        if (state.selectedTextIndex !=
                                            textItem.key) {
                                          FocusScope.of(context).unfocus();
                                        }
                                        cubit.updateSelectedItemIndex(
                                            textItem.key);
                                        scrollController.jumpToItem(
                                          property.textItems[textItem.key]
                                                  .size -
                                              1,
                                        );
                                      },
                                      child: MeasureSize(
                                        onChange: (size) {
                                          cubit.updateSelectedTextSize(size);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                            border: Border.all(
                                              color: textItem.key ==
                                                      state.selectedTextIndex
                                                  ? AppColors.green
                                                  : Colors.transparent,
                                              width: 1.sp,
                                            ),
                                          ),
                                          padding: EdgeInsets.all(10.sp),
                                          child: SizedBox(
                                            width: textItem.value.text
                                                    .split('\n')
                                                    .reduce((a, b) =>
                                                        a.length > b.length
                                                            ? a
                                                            : b)
                                                    .length *
                                                textItem.value.size *
                                                (10.w / 16.sp),
                                            child: TextFormField(
                                              controller:
                                                  textItem.value.controller,
                                              maxLines: null,
                                              onTap: () {
                                                cubit.updateSelectedItemIndex(
                                                    textItem.key);
                                                scrollController.jumpToItem(
                                                  property
                                                          .textItems[
                                                              textItem.key]
                                                          .size -
                                                      1,
                                                );
                                              },
                                              onChanged: (text) {
                                                cubit.updateTextText(text);
                                              },
                                              style: GoogleFonts.getFont(
                                                textItem.value.style,
                                                color: textItem.value.color,
                                                fontSize:
                                                    textItem.value.size.sp,
                                                // height: 10.h,
                                              ),
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                isDense: true,
                                                isCollapsed: true,
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Font Size',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      final cubit = context.read<HomeCubit>();

                      return SizedBox(
                        height: 120.h,
                        child: CupertinoPicker(
                          itemExtent: 50.h,
                          scrollController: scrollController,
                          onSelectedItemChanged: (i) {
                            cubit.updateTextSize(i + 1);
                          },
                          children: List.generate(50, (index) => index + 1).map(
                            (n) {
                              return Center(
                                child: Text(
                                  n.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      final cubit = context.read<HomeCubit>();
                      HomeProperty property = state.selectedHomeProperty;
                      return Row(
                        children: [
                          Text(
                            'Font Color',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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
                                : property
                                    .textItems[state.selectedTextIndex!].color,
                            icon: Icon(
                              Icons.circle,
                              size: 30.sp,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Font Style',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      final cubit = context.read<HomeCubit>();
                      HomeProperty property = state.selectedHomeProperty;
                      return SizedBox(
                        width: double.maxFinite,
                        height: 70.h,
                        child: FontsDropDown(
                          controller: _dropdownController,
                          hideDropDown: hideDropDown,
                          showDropDown: showDropDown,
                          value: state.selectedTextIndex == null
                              ? ''
                              : property
                                  .textItems[state.selectedTextIndex!].style,
                          onSelected: (font) {
                            cubit.updateFontStyle(font);
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      final cubit = context.read<HomeCubit>();
                      return SizedBox(
                        width: double.maxFinite,
                        child: TextButton(
                          onPressed: () {
                            cubit.addTextItem();
                            scrollController.jumpToItem(
                              15,
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.green,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text(
                            'Add Text',
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 100.h,
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
