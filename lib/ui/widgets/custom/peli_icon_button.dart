
import 'package:flutter/material.dart';
import 'package:peli/utils/device_size_config.dart';
import 'package:theme_provider/theme_provider.dart';

class PeliIconButton extends StatelessWidget {
  final String? text;
  final Function? onPressed;
  final Widget? icon;
  final bool isColor;
  final Color? colorButton;

  const PeliIconButton(
      {Key? key,
      this.text,
      this.onPressed,
      this.icon,
      this.isColor = false,
      this.colorButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: isColor
              ? colorButton
              : ThemeProvider.controllerOf(context).theme.data.cardColor,
          onPrimary: Colors.grey,
          // foreground
          elevation: 4.0,
          shadowColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          textStyle: TextStyle(
            fontSize: SizeConfig.calculateTextSize(14),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!,
            SizedBox(width: 8.0),
            Text(
              text!,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        onPressed: onPressed as void Function()?,
      ),
    );
  }
}
