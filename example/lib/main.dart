import 'package:flutter/material.dart';
import 'package:popup_banner_new/popup_banner.dart';

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
    "https://images.unsplash.com/photo-1564466809058-bf4114d55352?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fHByb2R1Y3R8ZW58MHx8MHx8&w=600&q=80",
    "https://images.unsplash.com/photo-1560769629-975ec94e6a86?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzd8fHByb2R1Y3R8ZW58MHx8MHx8&w=600&q=80",
    "https://images.unsplash.com/photo-1511556820780-d912e42b4980?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHByb2R1Y3R8ZW58MHx8MHx8&w=600&q=80",
    "https://images.unsplash.com/photo-1586495777744-4413f21062fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=600&q=80"
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
