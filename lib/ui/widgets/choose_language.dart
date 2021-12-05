import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peli/localization/language.dart';
import 'package:peli/localization/language_constants.dart';
import 'package:peli/ui/theme/themes.dart';
import 'package:peli/utils/device_size_config.dart';
import 'package:peli/utils/user_data.dart';
import 'package:peli/utils/utils.dart';

import 'custom/peli_select_button.dart';

class ChooseLanguage extends StatefulWidget {
  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  int _selectLanguage = 0;
  Language? language;
  var langCode = ["uz", "en", "ru"];

  @override
  Widget build(BuildContext context) {
    initCurrentLang();
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.calculateBlockHorizontal(20),
        right: SizeConfig.calculateBlockHorizontal(20),
        top: SizeConfig.calculateBlockVertical(16),
        bottom: SizeConfig.calculateBlockVertical(40),
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              getTranslated(context, 'changeLanguage'),
              style: AppThemeStyle.appBarStyle16,
            ),
          ),
          SizedBox(height: SizeConfig.calculateBlockVertical(16)),
          PeliSelectButton(
            icon: _selectLanguage == 0
                ? SvgPicture.asset('assets/icons/check.svg')
                : Container(),
            onPressed: () async {
              onLanguageChange(0);
            },
            text: getTranslated(context, 'uzbekLanguage'),
          ),
          PeliSelectButton(
            icon: _selectLanguage == 1
                ? SvgPicture.asset('assets/icons/check.svg')
                : Text(''),
            onPressed: () async {
              onLanguageChange(1);
            },
            text: getTranslated(context, 'kirillLanguage'),
          ),
          PeliSelectButton(
            icon: _selectLanguage == 2
                ? SvgPicture.asset('assets/icons/check.svg')
                : Text(''),
            onPressed: () async {
              onLanguageChange(2);
            },
            text: getTranslated(context, 'russianLanguage'),
          ),
        ],
      ),
    );
  }

  Future<void> initCurrentLang() async {
    UserData userData = new UserData();
    String langCode = await userData.getLang() ?? 'uz';

    setState(() {
      switch (langCode) {
        case 'uz':
          _selectLanguage = 0;
          break;
        case 'en':
          _selectLanguage = 1;
          break;
        case 'ru':
          _selectLanguage = 2;
          break;
      }
    });
  }

  void onLanguageChange(int i) {
    setState(() {
      _selectLanguage = i;
    });
    Utils.changeLanguage(context, langCode[_selectLanguage]);
  }
}
