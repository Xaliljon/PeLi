import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peli/ui/theme/my_themes.dart';
import 'package:peli/utils/device_size_config.dart';

class CustomGridView extends StatelessWidget {
  final Widget? childTopLeft;
  final Widget? childTopRight;
  final Widget? childBottomLeft;

  CustomGridView({
    Key? key,
    this.childTopLeft,
    this.childTopRight,
    this.childBottomLeft,
  }) : super(key: key);

  final paddingGrid = EdgeInsets.only(
    top: SizeConfig.calculateBlockVertical(30),
    left: SizeConfig.calculateBlockHorizontal(20),
    right: SizeConfig.calculateBlockHorizontal(20),
  );

  final paddingGrid2 = EdgeInsets.only(
    top: SizeConfig.calculateBlockVertical(20),
    bottom: SizeConfig.calculateBlockVertical(20),
    left: SizeConfig.calculateBlockHorizontal(20),
    right: SizeConfig.calculateBlockHorizontal(20),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: paddingGrid,
          child: SizedBox(
            height: SizeConfig.calculateBlockVertical(170),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: childTopLeft!),
                SizedBox(width: SizeConfig.calculateBlockHorizontal(20)),
                Expanded(child: childTopRight!),
              ],
            ),
          ),
        ),
        Padding(
          padding: paddingGrid2,
          child: SizedBox(
            height: SizeConfig.calculateBlockVertical(170),
            width: SizeConfig.calculateBlockHorizontal(170),
            child: childBottomLeft
          ),
        ),
      ],
    );
  }
}

class CustomTextIconButton extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Function? onPressed;
  final Color? color;

  const CustomTextIconButton(
      {Key? key, this.title, this.icon, this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed as void Function()?,
      padding: EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title!,
            style: TextStyle(
              color: color,
              fontSize: SizeConfig.calculateTextSize(14),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: SizeConfig.calculateBlockHorizontal(4)),
          Icon(
            icon,
            size: SizeConfig.calculateTextSize(18),
          )
        ],
      ),
    );
  }
}

Widget getBackground() {
  return Transform.rotate(
    angle: -200 * (3.14 / 200),
    child: Container(
      height: 310,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(160),
          topRight: Radius.circular(160),
        ),
        color: MyThemes.lightTheme.primaryColor.withOpacity(0.08),
      ),
    ),
  );
}
