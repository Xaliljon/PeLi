
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peli/ui/theme/my_themes.dart';
import 'package:theme_provider/theme_provider.dart';

class CustomSettingsButton extends StatelessWidget {
  final Function? onPressed;
  final String? subtitle;
  final String? title;
  final Widget? icon;
  final bool? isLeading;

  const CustomSettingsButton(
      {Key? key, this.onPressed, this.subtitle, this.title, this.icon, this.isLeading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = ThemeProvider.controllerOf(context).theme.data;
    return Card(
      elevation: 4.0,
      shadowColor: Colors.black26,
      margin: EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: CupertinoButton(
        onPressed: onPressed as void Function()?,
        color: theme.cardColor,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: subtitle == null ? 12 : 18,
        ),
        borderRadius: BorderRadius.circular(13.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(subtitle == null ? 4.0 : 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: MyThemes.lightTheme.primaryColor.withOpacity(0.13),
                    ),
                    child: icon),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                        color: theme.accentIconTheme.color,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                          color: theme.accentIconTheme.color!.withOpacity(0.5),
                        ),
                      ),
                  ],
                )
              ],
            ),
            Visibility(
              visible: isLeading ?? true,
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
                size: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
