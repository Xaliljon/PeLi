import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peli/localization/language_constants.dart';
import 'package:peli/ui/theme/themes.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = ThemeProvider.controllerOf(context).theme.data;
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, bottom: 30.0, left: 24.0, right: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(height: 16.0),
          Icon(
            Icons.info_outline_rounded,
            size: 40.0,
            color: theme.primaryColor.withOpacity(0.3),
          ),
          SizedBox(height: 8.0),
          Opacity(
            opacity: 0.5,
            child: Text(
              '${getTranslated(context, 'version')}: 1.0.0',
              style: AppThemeStyle.title14,
            ),
          ),

          SizedBox(height: 16.0),
          InkWell(
            onTap: () => launch('https://www.peli.uz'),
            child: Text(
              'www.peli.uz',
              style: AppThemeStyle.linkStyle,
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => launch('https://www.peli.uz'),
                  child: new SvgPicture.asset(
                    'assets/svg/logo_facebook.svg',
                    width: 20.0,
                    height: 20.0,
                  ),
                ),
                SizedBox(width: 30.0),
                InkWell(
                  onTap: () => launch('https://www.youtube.com'),
                  child: new SvgPicture.asset(
                    'assets/svg/logo_youtube.svg',
                    width: 20.0,
                    height: 20.0,
                  ),
                ),
                SizedBox(width: 30.0),
                InkWell(
                  onTap: () => launch('https://www.peli.uz'),
                  child: new SvgPicture.asset(
                    'assets/svg/logo_telegram.svg',
                    width: 20.0,
                    height: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Divider(),
          ),
          SizedBox(height: 20.0),
          Opacity(
            opacity: 1,
            child: Text(
              getTranslated(context, 'all_rights_reserved'),
              style: AppThemeStyle.title12,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
