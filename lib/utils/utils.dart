
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:peli/localization/language_constants.dart';
import 'package:peli/providers/locator.dart';
import 'package:peli/utils/toast_utils.dart';
import 'package:peli/utils/user_data.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';

class Utils {




  static void changeLanguage(BuildContext context, String language) async {
    UserData userData = UserData();
    userData.setLanguageSelected(true);
    userData.setLang(language);
    Locale _locale = await setLocale(language);
    MyApp.setLocale(context, _locale);
  }

  static void changeTheme(BuildContext context, String theme) async {
    UserData userData = UserData();
    userData.setTheme(theme);
    ThemeProvider.controllerOf(context).setTheme(theme);
  }

  static bool doubleTapExit(BuildContext context, bool pressed) {
    var duration = new Duration(seconds: 3);
    if(pressed){
      if(Platform.isAndroid){
        SystemNavigator.pop();
      }
    } else {
      pressed = true;
      ToastUtils.toastInfo('double_tap_to_exit', context);
    }
    Timer(duration, () async {
      pressed = false;
    });
    return false;
  }

  static void launchCaller(String? phone) async {
    var url = "tel:$phone";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Not Working $url';
    }
  }

  static Future<bool> isAuthTypeSelected() async {
    var _userData = locator<UserData>();
    var auth = await _userData.getAuth();
    print("auth: $auth");
    return auth == 0 ? false : true;
  }

  String twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  String formatBySeconds(Duration duration) =>
      twoDigits(duration.inSeconds.remainder(60));

  String formatByMinutes(Duration duration) {
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    return '$twoDigitMinutes:${formatBySeconds(duration)}';
  }

  String formatByHours(Duration duration) {
    return '${twoDigits(duration.inHours)}:${formatByMinutes(duration)}';
  }

  bool isStringEmpty(String? text){
    bool result = false;
    if(text == null) result = false;
    else if(text == '') result = false;
    else result = true;
    return result;
  }
}
