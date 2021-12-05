import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peli/localization/language_constants.dart';
import 'package:peli/providers/locator.dart';
import 'package:peli/ui/components/soliq_spinner.dart';
import 'package:peli/ui/theme/my_themes.dart';
import 'package:peli/ui/widgets/card/card_shadow.dart';
import 'package:peli/ui/widgets/modal_progress_hud.dart';
import 'package:peli/ui/widgets/peli_logo.dart';
import 'package:peli/utils/user_data.dart';
import 'package:theme_provider/theme_provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  UserData? userData = locator<UserData>();
  bool appLaunched = false, _isLoading = false, _successStatus = false;
  String? documentId = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      dismissible: false,
      color: Colors.white,
      progressIndicator: peliSpinner(),
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 70.0, horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PeliLogo(),
                    SizedBox(height: 30),
                    Text(
                      getTranslated(context, 'enter_cabinet'),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),
                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        getTranslated(context, 'auth_type'),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 40),
                    AuthButton(
                      svgIcon: 'assets/logo/e_imzo_logo.svg',
                      onPressed: () {
                        // checkStatus();
                      },
                    ),
                    if (Platform.isAndroid)
                      SizedBox(
                        height: 16,
                      ),
                    AuthButton(
                      svgIcon: 'assets/logo/face_id.svg',
                      onPressed: () {

                      },
                    ),
                    SizedBox(height: 16),
                    AuthButton(
                      svgIcon: 'assets/logo/one_id.svg',
                      onPressed: (){},
                      color: ThemeProvider.themeOf(context)
                          .data
                          .accentIconTheme
                          .color,
                    ),
                    SizedBox(height: 50),
                    Visibility(
                      visible: !appLaunched,
                      child: InkWell(
                        onTap: () {
                        },
                        highlightColor: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Opacity(
                            opacity: 0.5,
                            child: Text(
                              getTranslated(context, 'enter_un_auth'),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            getAppBar(),
          ],
        ),
      ),
    );
  }

  String getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  Widget getAppBar() {
    userData!.getAppLaunched().then((value) {
      setState(() {
        appLaunched = value;
      });
    });

    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Container(
        height: 40,
        alignment: Alignment.topRight,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          highlightColor: Colors.transparent,
          child: Visibility(
            visible: appLaunched,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
              child: Text(
                getTranslated(context, 'exit'),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: MyThemes.darkTheme.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
class AuthButton extends StatelessWidget {
  final Function? onPressed;
  final String? svgIcon;
  final Color? color;

  const AuthButton({Key? key, this.onPressed, this.svgIcon, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardShadow(
      child: CupertinoButton(
        color: ThemeProvider.themeOf(context).data.cardColor,
        padding:
        EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
        borderRadius: BorderRadius.circular(13.0),
        onPressed: onPressed as void Function()?,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new SvgPicture.asset(svgIcon!, height: 40.0, color: color),
          ],
        ),
      ),
    );
  }
}

