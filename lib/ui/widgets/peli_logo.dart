import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peli/localization/language_constants.dart';

class PeliLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new Image.asset(
              'assets/logo/peli.png',
              width: 200,
            ),
            SizedBox(height: 10.0),
            SizedBox(height: 6.0),
            Opacity(
              opacity: 0.5,
              child: Text(
                getTranslated(context, 'mobileAppLogo'),
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
