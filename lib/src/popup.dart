import 'package:flutter/material.dart';
import 'package:popup_banner_new/src/dialog_item.dart';

class PopupBanner {
  final BuildContext context;
  final List<String> images;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry dotsAlignment;
  final Color dotsColorActive;
  final Color dotsColorInactive;
  final double dotsMarginBottom;
  final bool useDots;
  final bool autoSlide;
  final Widget? customCloseButton;
  final Duration slideChangeDuration;
  final Function(int) onClick;
  final bool enableCache;

  PopupBanner({
    required this.context,
    required this.images,
    this.height,
    this.fit = BoxFit.fill,
    this.dotsAlignment = Alignment.bottomLeft,
    this.dotsColorActive = Colors.green,
    this.dotsColorInactive = Colors.grey,
    this.dotsMarginBottom = 10,
    this.useDots = true,
    this.autoSlide = true,
    this.slideChangeDuration = const Duration(seconds: 6),
    this.customCloseButton,
    required this.onClick,
    this.enableCache = false,
  });

  Future<void> show() {
    return showDialog(
      context: context,
      builder: (context) => DialogItem(
        context: context,
        images: images,
        fit: fit,
        height: height,
        dotsAlignment: dotsAlignment,
        dotsColorActive: dotsColorActive,
        dotsColorInactive: dotsColorInactive,
        dotsMarginBottom: dotsMarginBottom,
        useDots: useDots,
        autoSlide: autoSlide,
        customCloseButton: customCloseButton,
        onClick: (index) => onClick(index),
        slideChangeDuration: slideChangeDuration,
        enableCache: enableCache,
      ),
    );
  }
}
