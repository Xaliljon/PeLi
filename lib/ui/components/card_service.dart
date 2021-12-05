import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_provider/theme_provider.dart';

class CardService extends StatelessWidget {
  const CardService({this.text, this.onTap, this.icon});

  final String? text;
  final String? icon;
  final GestureTapCallback? onTap;

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
        onPressed: onTap,
        color: theme.cardColor,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        borderRadius: BorderRadius.circular(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: theme.primaryColor.withOpacity(0.1),
              child: SvgPicture.asset(icon!, height: 26.0, color: theme.primaryColor),
            ),
            SizedBox(height: 13.0),
            Text(
              text!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
                color: theme.accentIconTheme.color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
