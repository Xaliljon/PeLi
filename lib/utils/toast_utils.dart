import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peli/localization/language_constants.dart';
import 'package:peli/ui/theme/my_themes.dart';
import 'package:peli/ui/widgets/custom/custom_toast.dart';
import 'package:peli/ui/widgets/custom/custom_toast_widget.dart';
class ToastUtils{
  static toastInfo(String key, BuildContext context) {
    CustomToast(
      context,
      color: MyThemes.darkTheme.primaryColor,
      borderRadius: 16.0,
      icon: Icon(Icons.info_outline_rounded, color: Colors.white),
      title: getTranslated(context, key),
      isCircle: false,
      listener: (status) {
        print(status);
      },
    )..show();
  }

  static toastSuccess(String key, BuildContext context) {
    CustomToast(
      context,
      typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
      color: Colors.green,
      borderRadius: 16.0,
      icon: Icon(Icons.check_circle_outline_outlined, color: Colors.white),
      title: getTranslated(context, key),
      isCircle: false,
      listener: (status) {
        print(status);
      },
    )..show();
  }

  static toastError(String key, BuildContext context) {
    CustomToast(
      context,
      typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
      color: Colors.redAccent,
      borderRadius: 16.0,
      icon: Icon(Icons.close, color: Colors.white),
      title: getTranslated(context, key),
      isCircle: false,
      listener: (status) {
        print(status);
      },
    )..show();
  }

  static toastInfoGeneral(String? message, BuildContext? context) {
    CustomToast(
      context,
      color: MyThemes.darkTheme.primaryColor,
      borderRadius: 16.0,
      icon: Icon(Icons.info_outline_rounded, color: Colors.white),
      title: message,
      isCircle: false,
      listener: (status) {
        print(status);
      },
    )..show();
  }

  static toastSuccessGeneral(String? message, BuildContext? context) {
    CustomToast(
      context,
      typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
      color: Colors.green,
      borderRadius: 16.0,
      icon: Icon(Icons.check_circle_outline_outlined, color: Colors.white),
      title: message,
      isCircle: false,
      listener: (status) {
        print(status);
      },
    )..show();
  }

  static toastErrorGeneral(String? message, BuildContext? context) {
    CustomToast(
      context,
      typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
      color: Colors.redAccent,
      borderRadius: 16.0,
      icon: Icon(Icons.close, color: Colors.white),
      title: message,
      isCircle: false,
      listener: (status) {
        print(status);
      },
    )..show();
  }

}