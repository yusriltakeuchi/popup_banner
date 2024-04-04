import 'package:flutter/material.dart';
import 'package:popup_banner/popup_banner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "https://tinyurl.com/popup-banner-image",
    "https://tinyurl.com/popup-banner-image2",
    "https://tinyurl.com/popup-banner-image3",
    "https://tinyurl.com/popup-banner-image4"
  ];

  List<String> imagesLocal = [
    "assets/images/popup-banner-local-image.jpg",
    "assets/images/popup-banner-local-image2.jpg",
    "assets/images/popup-banner-local-image3.jpeg",
    "assets/images/popup-banner-local-image4.jpg"
  ];

  void showDefaultPopup() {
    PopupBanner(
      context: context,
      images: images,
      enableCache: true,
      onClick: (index) {
        debugPrint("CLICKED $index");
      },
    ).show();
  }

  void showHideDotsPopup() {
    PopupBanner(
      context: context,
      images: images,
      useDots: false,
      enableCache: true,
      onClick: (index) {
        debugPrint("CLICKED $index");
      },
    ).show();
  }

  void showCustomizeDots() {
    PopupBanner(
      context: context,
      images: images,
      dotsAlignment: Alignment.bottomCenter,
      dotsColorActive: Colors.blue,
      enableCache: true,
      dotsColorInactive: Colors.grey.withOpacity(0.5),
      onClick: (index) {
        debugPrint("CLICKED $index");
      },
    ).show();
  }

  void showNonactiveSlideCustomClose() {
    PopupBanner(
      context: context,
      images: images,
      autoSlide: false,
      enableCache: true,
      customCloseButton: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        child: const Text(
          "Close",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      onClick: (index) {
        debugPrint("CLICKED $index");
      },
    ).show();
  }

  void showFromLocal() {
    PopupBanner(
      context: context,
      images: imagesLocal,
      onClick: (index) {},
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buttonWidget(
              title: "Default Popup",
              onClick: () => showDefaultPopup(),
            ),
            _buttonWidget(
              title: "Hide Dots Popup",
              onClick: () => showHideDotsPopup(),
            ),
            _buttonWidget(
              title: "Customize Dots Popup",
              onClick: () => showCustomizeDots(),
            ),
            _buttonWidget(
              title: "Disable Auto Slide & Custom Close Popup",
              onClick: () => showNonactiveSlideCustomClose(),
            ),
            _buttonWidget(
              title: "Local Asset Popup",
              onClick: () => showFromLocal(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buttonWidget({
    required String title,
    required VoidCallback onClick,
  }) {
    return ElevatedButton(
      onPressed: () => onClick(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
