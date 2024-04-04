import 'package:flutter/material.dart';
import 'package:popup_banner/src/slider_item.dart';

class DialogItem extends StatelessWidget {
  final BuildContext context;
  final List<String> images;
  final double? height;
  final BoxFit fit;
  final Function(int) onClick;
  final AlignmentGeometry dotsAlignment;
  final Color dotsColorActive;
  final Color dotsColorInactive;
  final double dotsMarginBottom;
  final bool useDots;
  final bool autoSlide;
  final Widget? customCloseButton;
  final Duration slideChangeDuration;
  final bool enableCache;

  const DialogItem({
    Key? key,
    required this.context,
    required this.images,
    this.height,
    this.fit = BoxFit.fill,
    required this.onClick,
    this.dotsAlignment = Alignment.bottomLeft,
    this.dotsColorActive = Colors.green,
    this.dotsColorInactive = Colors.grey,
    this.dotsMarginBottom = 10,
    this.useDots = true,
    this.slideChangeDuration = const Duration(seconds: 6),
    this.autoSlide = false,
    this.customCloseButton,
    this.enableCache = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: _dialogContent(context),
    );
  }

  Widget _dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(
            top: 13.0,
            right: 8.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 0.0,
                offset: Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SliderItem(
                  height: height ?? (MediaQuery.of(context).size.height * 0.8),
                  fit: fit,
                  imageList: images,
                  dotsAlignment: dotsAlignment,
                  onClick: (index) => onClick(index),
                  useDots: useDots,
                  dotsColorActive: dotsColorActive,
                  dotsColorInactive: dotsColorInactive,
                  dotsMarginBottom: dotsMarginBottom,
                  autoSlide: autoSlide,
                  enableCache: enableCache,
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Align(
            alignment: Alignment.topRight,
            child: customCloseButton ??
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        offset: const Offset(0, 2),
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
