import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peli/localization/language_constants.dart';
import 'package:peli/ui/components/bottom_modal_sheet.dart';
import 'package:peli/ui/theme/my_themes.dart';
import 'package:peli/ui/theme/themes.dart';
import 'package:peli/ui/widgets/app_bar_page.dart';
import 'package:peli/ui/widgets/choose_language.dart';
import 'package:peli/ui/widgets/choose_theme_mode.dart';
import 'package:peli/ui/widgets/custom/custom_settings_button.dart';
import 'package:peli/utils/device_size_config.dart';
import 'package:peli/utils/user_data.dart';
import 'package:theme_provider/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  final bool? isAppBarIcon;

  const SettingsPage({Key? key, this.isAppBarIcon}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _lang = "", _theme = "";
  UserData userData = new UserData();

  @override
  Widget build(BuildContext context) {
    var theme = ThemeProvider.controllerOf(context).theme.data;
    initTitles();
    var screens = [
      ChooseLanguage(),
      ChooseThemeMode(),
    ];

    void _showSettingModalSheet(int position) {
      showModalBottomSheet(
        barrierColor: Colors.black.withOpacity(0.3),
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        ),
        builder: (context) => BottomModalSheet(child: screens[position]),
      );
    }

    return Scaffold(
      appBar: appBarPage(context, title: getTranslated(context, 'settings')),
      body: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.calculateBlockVertical(16),
          left: SizeConfig.calculateBlockHorizontal(20),
          right: SizeConfig.calculateBlockHorizontal(20),
          bottom: SizeConfig.calculateBlockVertical(40),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSettingsButton(
                onPressed: () {
                  _showSettingModalSheet(0);
                },
                icon: Icon(
                  Icons.language,
                  color: theme.primaryColor,
                ),
                title: getTranslated(context, "language"),
                subtitle: _lang,
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(16)),
              CustomSettingsButton(
                onPressed: () {
                  _showSettingModalSheet(1);
                },
                icon: Icon(
                  Icons.mode_edit,
                  color: theme.primaryColor,
                ),
                title: getTranslated(context, 'theme'),
                subtitle: _theme,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getAppInfoVersion(context) {
    var theme = ThemeProvider.controllerOf(context).theme.data;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: theme.primaryColor,
            size: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 4.0),
            child: Text(
              getTranslated(context, 'about'),
              style: AppThemeStyle.appBarStyle16,
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Text(
              '${getTranslated(context, 'version')}: 1.0.0',
              style: AppThemeStyle.title14,
            ),
          )
        ],
      ),
    );
  }

  Widget getAppBar(context) {
    return AppBar(
      elevation: 1.0,
      centerTitle: true,
      shadowColor: Colors.black45,
      title: Text(getTranslated(context, 'settings'),
          style: AppThemeStyle.appBarStyle16),
      leading: widget.isAppBarIcon!
          ? IconButton(
              icon: Icon(Icons.keyboard_backspace_outlined),
              color: MyThemes.lightTheme.primaryColor,
              onPressed: () => Navigator.pop(context),
            )
          : SizedBox(),
    );
  }

  Future<String> initTitles() async {
    String langCode = await userData.getLang() ?? 'uz';
    String themeCode = await userData.getTheme() ?? 'light';

    setState(() {
      switch (langCode) {
        case 'uz':
          _lang = "O'zbek";
          break;
        case 'en':
          _lang = "Ўзбек";
          break;
        case 'ru':
          _lang = "Русский";
          break;
      }

      switch (themeCode) {
        case 'light':
          _theme = getTranslated(context, 'light');
          break;
        case 'dark':
          _theme = getTranslated(context, 'dark');
          break;
      }
    });
    return _theme;
  }
}
