import 'package:flutter/cupertino.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static double? screenWidth;
  static late double screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static double? safeBlockVertical;
  static double? screenPercentage;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    // screenWidth=375;
    // screenHeight=812;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth! / 100 - _safeAreaHorizontal / 100);
    safeBlockVertical = (screenHeight / 100 - _safeAreaVertical / 100);
  }

  static double get aspectRatio {
    return WidgetsBinding.instance?.window.physicalSize.aspectRatio ?? 1;
  }

  /// Devices' Pixel Ratio
  static double get pixelRatio {
    return WidgetsBinding.instance?.window.devicePixelRatio ?? 1;
  }

  static double? getFullWidth() {
    return screenWidth;
  }

  static double calculateTextSize(int fontSize) {
    return safeBlockHorizontal * (fontSize * 6.6) / 27;
  }

  static double calculateBlockVertical(double blockSize) {
    var size = (blockSize / 812) * screenHeight;
    return size;
  }

  static double calculateBlockHorizontal(double blockSize) {
    var size = (blockSize / 375) * screenWidth!;
    return size;
  }
}
