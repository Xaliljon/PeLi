
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peli/ui/theme/my_themes.dart';
import 'package:peli/utils/device_size_config.dart';

class CustomButtonPrimary extends StatelessWidget {
  final Function? onPressed;
  final Widget? title;

  const CustomButtonPrimary({Key? key, this.onPressed, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed as void Function()?,
      child: Container(
        height: SizeConfig.calculateBlockVertical(60),
        width: MediaQuery.of(context).size.width,
        child: CupertinoButton(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          color: MyThemes.darkTheme.primaryColor,
          borderRadius: BorderRadius.circular(13),
          onPressed: onPressed as void Function()?,
          child: title!,
        ),
      ),
    );
  }
}
