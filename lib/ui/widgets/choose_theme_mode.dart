import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peli/localization/language_constants.dart';
import 'package:peli/ui/theme/my_themes.dart';
import 'package:peli/ui/theme/themes.dart';
import 'package:peli/ui/widgets/custom/peli_icon_button.dart';
import 'package:peli/utils/device_size_config.dart';
import 'package:peli/utils/utils.dart';

import 'package:theme_provider/theme_provider.dart';


class ChooseThemeMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = ThemeProvider.controllerOf(context).theme.data;
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.calculateBlockHorizontal(24),
        right: SizeConfig.calculateBlockHorizontal(24),
        top: SizeConfig.calculateBlockVertical(16),
        bottom: SizeConfig.calculateBlockVertical(55),
      ),
      child: Column(
        children: [
          Text(
            getTranslated(context, 'changeThemeMode'),
            style: AppThemeStyle.appBarStyle16,
          ),
          SizedBox(height: SizeConfig.calculateBlockVertical(40)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PeliIconButton(
                isColor: true,
                colorButton: MyThemes.lightTheme.cardColor,
                text: getTranslated(context, 'light'),
                onPressed: () {
                  Utils.changeTheme(context, 'light');
                },
                icon: Icon(
                  Icons.wb_sunny_rounded,
                  size: SizeConfig.calculateTextSize(20),
                  color: theme.primaryColor,
                ),
              ),
              SizedBox(width: SizeConfig.calculateBlockHorizontal(16)),
              PeliIconButton(
                isColor: true,
                colorButton: MyThemes.darkTheme.cardColor,
                text: getTranslated(context, 'dark'),
                onPressed: () {
                  Utils.changeTheme(context, 'dark');
                },
                icon: SvgPicture.asset('assets/icons/moon.svg'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
