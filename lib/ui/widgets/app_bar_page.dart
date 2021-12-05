
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peli/utils/device_size_config.dart';

AppBar appBarPage(BuildContext context,
    {required String title,
    bool icon = true,
    bool isTrailingIcon = false,
    Widget? trailingIcon,
    PreferredSizeWidget? bottom}) {
  return AppBar(
    elevation: 1.0,
    shadowColor: Colors.transparent,
    centerTitle: true,
    bottom: bottom,
    title: Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: SizeConfig.calculateTextSize(16),
              fontWeight: FontWeight.bold,
              letterSpacing: 0.1,
              color: Color(0xff325ECD)
          ),
        ),
    SizedBox(
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'Agne',
          color: Colors.red
        ),
        child: Text('Ilova test rejimida ishlamoqda')
      ),
    )
      ],
    ),
    leading: icon
        ? CupertinoButton(
            onPressed: () => Navigator.pop(context),
            child: Icon(Icons.keyboard_backspace_outlined),
          )
        : Container(),
    actions: [isTrailingIcon ? trailingIcon! : Container()],
  );
}
