import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peli/localization/language.dart';
import 'package:peli/localization/language_constants.dart';
import 'package:peli/ui/theme/my_themes.dart';
import 'package:peli/ui/widgets/custom/peli_icon_button.dart';
import 'package:peli/ui/widgets/custom/peli_select_button.dart';
import 'package:peli/ui/widgets/peli_logo.dart';
import 'package:peli/utils/device_size_config.dart';
import 'package:peli/utils/utils.dart';
import 'package:peli/views/splash_page/auth_page.dart';
import 'package:theme_provider/theme_provider.dart';

class SplashSettings extends StatefulWidget {
  const SplashSettings({Key? key}) : super(key: key);

  @override
  _SplashSettingsState createState() => _SplashSettingsState();
}

class _SplashSettingsState extends State<SplashSettings> {
  int _selectLanguage = 0;
  Language? language;
  var langCode = ["uz", "en", "ru"];

  @override
  Widget build(BuildContext context) {
    var theme = ThemeProvider.controllerOf(context).theme.data;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.calculateBlockHorizontal(30),
                right: SizeConfig.calculateBlockHorizontal(30)
                //  , bottom: 200.0
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.calculateBlockVertical(50.0),
                      bottom: SizeConfig.calculateBlockVertical(40.0)),
                  child: PeliLogo(),
                ),
                //Выберите язык
                chooseLanguage(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Divider(),
                ),
                //Выберите тему
                chooseThemeMode(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: theme.primaryColor,
        onPressed: () {
          if (_selectLanguage == 0)
            Utils.changeLanguage(context, langCode[_selectLanguage]);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AuthPage()),
          );
        },
        child: Icon(Icons.arrow_forward_ios_outlined,
            size: 20.0, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // chooseLanguage(),
  Widget chooseLanguage() {
    return Column(
      children: [
        Center(
          child: Opacity(
            opacity: 0.4,
            child: Text(
              getTranslated(context, 'changeLanguage'),
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        PeliSelectButton(
          icon: _selectLanguage == 0
              ? SvgPicture.asset('assets/icons/check.svg')
              : Container(),
          onPressed: () async {
            setState(() {
              _selectLanguage = 0;
            });
            Utils.changeLanguage(context, langCode[_selectLanguage]);
          },
          text: getTranslated(context, 'uzbekLanguage'),
        ),
        PeliSelectButton(
          icon: _selectLanguage == 1
              ? SvgPicture.asset('assets/icons/check.svg')
              : Text(''),
          onPressed: () async {
            setState(() {
              _selectLanguage = 1;
            });
            Utils.changeLanguage(context, langCode[_selectLanguage]);
          },
          text: getTranslated(context, 'kirillLanguage'),
        ),
        PeliSelectButton(
          icon: _selectLanguage == 2
              ? SvgPicture.asset('assets/icons/check.svg')
              : Text(''),
          onPressed: () async {
            setState(() {
              _selectLanguage = 2;
            });
            Utils.changeLanguage(context, langCode[_selectLanguage]);
          },
          text: getTranslated(context, 'russianLanguage'),
        ),
      ],
    );
  }

  //Выберите тему
  Widget chooseThemeMode() {
    return Column(
      children: [
        Opacity(
          opacity: 0.4,
          child: Text(
            getTranslated(context, 'changeThemeMode'),
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 13.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PeliIconButton(
              text: getTranslated(context, 'light'),
              onPressed: () {
                Utils.changeTheme(context, 'light');
              },
              icon: Icon(
                Icons.wb_sunny_rounded,
                size: 20,
                color: MyThemes.lightTheme.primaryColor,
              ),
            ),
            SizedBox(width: 16.0),
            PeliIconButton(
              text: getTranslated(context, 'dark'),
              onPressed: () {
                Utils.changeTheme(context, 'dark');
              },
              icon: SvgPicture.asset('assets/icons/moon.svg'),
            ),
          ],
        ),
      ],
    );
  }
}
