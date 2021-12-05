
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peli/localization/language_constants.dart';
import 'package:peli/providers/locator.dart';
import 'package:peli/providers/router.gr.dart';
import 'package:peli/ui/widgets/peli_logo.dart';
import 'package:peli/utils/device_size_config.dart';
import 'package:peli/utils/user_data.dart';
import 'package:peli/utils/utils.dart';

import 'package:auto_route/auto_route.dart';
import 'package:peli/views/splash_page/auth_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserData? _userData = locator<UserData>();
  // ApiProvider? _apiProvider = locator<ApiProvider>();
  var image = Base64Decoder();

  checkToken() async {
    var isLangSelected = await _userData!.getLanguageSelected() ?? false;
    if (isLangSelected) {
      context.router.popAndPush(MainPageRoute());
    } else {
      context.router.popAndPush(SplashSettingsRoute());
    }
  }

  startTime(bool success) async {
    var _duration = new Duration(seconds: 3);

    if (success & ((await Utils.isAuthTypeSelected())))
      return new Timer(_duration, changeLanguageScreen);
    else {
      // _userData!.clearFizData();
      // context.router.pop(AuthPageRoute());
      // context.router.removeLast();
    }
  }

  void changeLanguageScreen() async {
    bool langSelect = await _userData!.getLanguageSelected() ?? false;
    if (langSelect) {
      _userData!.getAuth().then((value) {
        // context.router.popAndPush(NavigationCabinetViewRoute());
        // Navigator.of(context).pushReplacementNamed(Routes.navigationCabinetView);
      }).whenComplete(() {});
    } else {
      context.router.popAndPush(SplashSettingsRoute());
      // _navigationService.pushNamedAndRemoveUntil(Routes.splashSettings);
    }
  }

  @override
  void initState() {
    super.initState();
    initLanguage();
    checkToken();
    // checkForUpdate();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PeliLogo(),
              SizedBox(height: 32.0),
              CupertinoActivityIndicator(),
            ],
          ),
          //copyright
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                getTranslated(context, 'copyright'),
                textScaleFactor: 1.0,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, fontFamily: 'Montserrat'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSnack(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> initLanguage() async {
    String langCode = await _userData!.getLang() ?? 'uz';
    Utils.changeLanguage(context, langCode);
  }
}
