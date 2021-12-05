import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peli/localization/language_constants.dart';
import 'package:peli/providers/router.gr.dart';
import 'package:peli/ui/components/bottom_modal_sheet.dart';
import 'package:peli/ui/components/card_service.dart';
import 'package:peli/ui/theme/themes.dart';
import 'package:peli/ui/widgets/custom/custom_button_primary.dart';
import 'package:peli/ui/widgets/peli_logo.dart';
import 'package:peli/utils/device_size_config.dart';
import 'package:peli/utils/toast_utils.dart';
import 'package:peli/utils/user_data.dart';

import 'package:theme_provider/theme_provider.dart';
import 'package:auto_route/auto_route.dart';
import '../about_app_view.dart';
import 'main_page_widgets.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  UserData _userData = UserData();
  bool pressed = false;
  bool _hasDeepLink = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //Utils.doubleTapExit(context, pressed);
        doubleTapExit(context);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              getBackground(),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.calculateBlockHorizontal(60)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PeliLogo(),
                      // getServicesGrid(),
                      getServicesColumn(),

                      SizedBox(height: SizeConfig.calculateBlockHorizontal(100)),
                    ],
                  ),
                ),
              ),
              loginEimzo(),
              getAppBar(),
            ],
          ),
        ),
      ),
    );
  }
  Widget loginEimzo() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.calculateBlockHorizontal(24),
          right: SizeConfig.calculateBlockHorizontal(24),
          bottom: SizeConfig.calculateBlockVertical(30),
        ),
        child: CustomButtonPrimary(
          title: Text(
            getTranslated(context, 'loginCabinet'),
            textAlign: TextAlign.center,
            style: AppThemeStyle.buttonWhite16,
          ),
          onPressed: () {
            context.router.push(AuthPageRoute());
            // _navigationService.navigateTo(Routes.authPage);
          },
        ),
      ),
    );
  }
  bool doubleTapExit(BuildContext context) {
      var duration = new Duration(seconds: 3);
      if(pressed){
        if(Platform.isAndroid){
          SystemNavigator.pop();
        }
      } else {
        pressed = true;
        ToastUtils.toastInfo('double_tap_to_exit', context);
      }
      Timer(duration, () async {
        pressed = false;
      });
      return false;
  }




  void _showAboutApp() {
    showModalBottomSheet(
      barrierColor: Colors.black.withOpacity(0.3),
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      ),
      builder: (context) => BottomModalSheet(child: AboutAppView()),
    );
  }

  Widget getServicesColumn() {
    return CustomGridView(
      childTopLeft: CardService(
        icon: 'assets/icons/services/edit_table.svg',
        text: 'Xizmatlar',
        onTap: () {
          // context.router.push(SelfEmployeePnflAccessRoute());
          // _navigationService.navigateTo(Routes.selfEmployeePnflAccess);
        },
      ),
      childTopRight: CardService(
        icon: 'assets/icons/services/tax_benefit.svg',
        // text: getTranslated(context, 'regCheck'),
        text: "Mutaxassis \nkurslari",
        onTap: () async {
        },
      ),
      childBottomLeft: CardService(
        icon: 'assets/icons/services/poll.svg',
        text: 'Statistika',
        onTap: () {
        },
      ),
    );
  }

  Widget getAppBar() {
    var theme = ThemeProvider.controllerOf(context).theme.data;
    return Padding(
      padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            onPressed: () => _showAboutApp(),
            padding: EdgeInsets.all(0.0),
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(9.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  border: Border.all(color: Colors.grey)),
              child: SvgPicture.asset(
                'assets/icons/info.svg',
                color: theme.iconTheme.color,
              ),
            ),
          ),
          CupertinoButton(
            onPressed: () {
              context.router.push(SettingsPageRoute(isAppBarIcon: true));
              // _navigationService.navigateTo(Routes.settingsPage,
              //     arguments: SettingsPageArguments(isAppBarIcon: true));
            },
            padding: EdgeInsets.all(0.0),
            child: new Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  border: Border.all(color: Colors.grey)),
              child: SvgPicture.asset(
                'assets/icons/settings.svg',
                color: theme.iconTheme.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
