import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_canva/utils/app_colors.dart';

class FontsDropDown extends StatefulWidget {
  final Function(String)? onSelected;
  final OverlayPortalController controller;
  final void Function() hideDropDown;
  final void Function() showDropDown;
  final String value;

  const FontsDropDown({
    super.key,
    this.onSelected,
    required this.controller,
    required this.hideDropDown,
    required this.showDropDown,
    required this.value,
  });

  @override
  State<FontsDropDown> createState() => FontsDropDownState();
}

class FontsDropDownState extends State<FontsDropDown> {
  final _link = LayerLink();
  final GlobalKey _anchorKey = GlobalKey();
  final ScrollController _dropdownscrollController = ScrollController();
  late TextEditingController _textController;
  List<String> displayedFontNames = [];
  List<String> filteredFontNames = [];
  List<String> fontNames = [];
  int currentPage = 1;
  bool loadingMore = false;
  bool canLoadmore = true;
  final int itemsPerPage = 20;
  late int pagesCount;

  @override
  void didUpdateWidget(covariant FontsDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _textController = TextEditingController(text: widget.value);
      _textController.addListener(onFilter);
    }
  }

  @override
  void initState() {
    super.initState();
    Map<String, TextStyle Function()> fontMap = GoogleFonts.asMap();
    fontNames = fontMap.keys.toList();
    displayedFontNames = fontNames.take(itemsPerPage).toList();
    pagesCount = (fontNames.length / itemsPerPage).ceil();
    _textController = TextEditingController(text: widget.value);
    _textController.addListener(onFilter);
    _dropdownscrollController.addListener(() {
      if (_dropdownscrollController.position.pixels ==
          _dropdownscrollController.position.maxScrollExtent) {
        loadMore();
      }
    });
  }

  @override
  void dispose() {
    _dropdownscrollController.dispose();
    super.dispose();
  }

  void onFilter() {
    String query = _textController.text;
    filteredFontNames = fontNames
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .take(20)
        .toList();
    setState(() {});
  }

  void loadMore() async {
    if (loadingMore || !canLoadmore) {
      return;
    }
    setState(() {
      loadingMore = true;
    });

    if (pagesCount <= currentPage) {
      setState(() {
        canLoadmore = false;
        loadingMore = false;
      });
      return;
    }
    setState(() {
      canLoadmore = true;
    });
    displayedFontNames.addAll(
      fontNames.getRange(
        currentPage * itemsPerPage,
        min(
          ((currentPage + 1) * itemsPerPage),
          fontNames.length,
        ),
      ),
    );
    if (context.mounted) {
      setState(() {
        loadingMore = false;
        currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: widget.controller,
        overlayChildBuilder: (BuildContext context) {
          return CompositedTransformFollower(
            link: _link,
            showWhenUnlinked: false,
            targetAnchor: Alignment.bottomLeft,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Material(
                elevation: 3.0,
                color: Colors.white,
                child: SizedBox(
                  width: getWidth(_anchorKey),
                  height: 300.h,
                  child: ListView.builder(
                    controller: _dropdownscrollController,
                    itemCount: _textController.text.isEmpty
                        ? displayedFontNames.length + 1
                        : filteredFontNames.length,
                    itemBuilder: (context, index) {
                      if (index >= displayedFontNames.length) {
                        return const CircularProgressIndicator();
                      }
                      String currentFont = _textController.text.isEmpty
                          ? displayedFontNames[index]
                          : filteredFontNames[index];
                      return ListTile(
                        title: Text(
                          currentFont,
                          style: GoogleFonts.getFont(
                            currentFont,
                            color: Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                        // title: Text(index.toString()),
                        onTap: () {
                          widget.hideDropDown();
                          widget.onSelected?.call(currentFont);
                          _textController.text = currentFont;
                          setState(() {});
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
        child: GestureDetector(
          key: _anchorKey,
          child: TextFormField(
            key: ValueKey(widget.value),
            controller: _textController,
            onTap: () {
              widget.showDropDown();
            },

            decoration: InputDecoration(
              hintText: 'Search for a font',
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(15.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(15.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(15.r),
              ),
              hintStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            // enabled: false,
          ),
        ),
      ),
    );
  }

  double? getWidth(GlobalKey key) {
    final BuildContext? context = key.currentContext;
    if (context != null) {
      final RenderBox box = context.findRenderObject()! as RenderBox;
      return box.hasSize ? box.size.width : null;
    }
    return null;
  }
}
