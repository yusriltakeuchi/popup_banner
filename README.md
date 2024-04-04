# Popup Banner

Popup Banner is a package to show banner slider using modal dialog. We can set the image location, auto slide settings, dots indicator and others.

![Popup Banner](https://media.giphy.com/media/4FLWYYtNDbkK7J0bpm/giphy-downsized-large.gif)

## Features
- Customizable Popup
- Custom Close Button
- Load Image From Network & Local
- Auto Slider & Timer
- Custom Dots Indicator Position & Color
- Cache image

## Getting started

You must add the library as a dependency to your project.
```yaml
dependencies:
  popup_banner_new: ^1.0.1
```
You should then run flutter packages get

## Example Project

There is a detailed example project in the `example` folder. You can directly run and play on it. There are code snippets from example project below.

## Default Popup
<img src="https://i.ibb.co/pLwG1H2/Simulator-Screen-Shot-i-Phone-13-2022-07-23-at-02-10-10.png" width="200">

```dart
PopupBanner(
  context: context,
  enableCache: true,
  images: [
    "https://tinyurl.com/popup-banner-image",
    "https://tinyurl.com/popup-banner-image2",
    "https://tinyurl.com/popup-banner-image3",
    "https://tinyurl.com/popup-banner-image4"
  ],
  onClick: (index) {
    debugPrint("CLICKED $index");
  },
).show();
```

## Hide Dots Popup
<img src="https://i.ibb.co/sFfVPHq/Simulator-Screen-Shot-i-Phone-13-2022-07-23-at-02-12-12.png" width="200">

```dart
PopupBanner(
  context: context,
  enableCache: true,
  images: [
    "https://tinyurl.com/popup-banner-image",
    "https://tinyurl.com/popup-banner-image2",
    "https://tinyurl.com/popup-banner-image3",
    "https://tinyurl.com/popup-banner-image4"
  ],
  useDots: false,
  onClick: (index) {
    debugPrint("CLICKED $index");
  },
).show();
```

## Customize Dots Popup
<img src="https://i.ibb.co/wsg4h19/Simulator-Screen-Shot-i-Phone-13-2022-07-23-at-02-13-10.png" width="200">

```dart
PopupBanner(
  context: context,
  enableCache: true,
  images: [
    "https://tinyurl.com/popup-banner-image",
    "https://tinyurl.com/popup-banner-image2",
    "https://tinyurl.com/popup-banner-image3",
    "https://tinyurl.com/popup-banner-image4"
  ],
  dotsAlignment: Alignment.bottomCenter,
  dotsColorActive: Colors.blue,
  dotsColorInactive: Colors.grey.withOpacity(0.5),
  onClick: (index) {
    debugPrint("CLICKED $index");
  },
).show();
```

## Disable Auto Slide & Custom Close Popup
<img src="https://i.ibb.co/HCZW1dj/Simulator-Screen-Shot-i-Phone-13-2022-07-23-at-02-13-57.png" width="200">

```dart
PopupBanner(
  context: context,
  enableCache: true,
  images: [
    "https://tinyurl.com/popup-banner-image",
    "https://tinyurl.com/popup-banner-image2",
    "https://tinyurl.com/popup-banner-image3",
    "https://tinyurl.com/popup-banner-image4"
  ],
  autoSlide: false,
  customCloseButton: ElevatedButton(
    onPressed: () => Navigator.pop(context),
    style: ElevatedButton.styleFrom(
      primary: Colors.blue,
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
```

## Local Asset Popup
<img src="https://i.ibb.co/cLR2N9n/Simulator-Screen-Shot-i-Phone-13-2022-07-23-at-02-14-51.png" width="200">

```dart
PopupBanner(
  context: context,
  images: [
    "assets/images/popup-banner-local-image.jpg",
    "assets/images/popup-banner-local-image2.jpg",
    "assets/images/popup-banner-local-image3.jpeg",
    "assets/images/popup-banner-local-image4.jpg"
  ],
  fromNetwork: false,
  onClick: (index) {},
).show()
```

## Contributions
* If you **found a bug**, open an issue.
* If you **have a feature request**, open an issue.
* If you **want to contribute**, submit a pull request.
## Version compatability

See CHANGELOG for all breaking (and non-breaking) changes.

<hr/>
Made with ❤ by <a href="https://leeyurani.com">Yusril Rapsanjani</a>
</p>