import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:peli/providers/locator.dart';
import 'package:peli/providers/router.gr.dart';
import 'package:peli/service/network_service.dart';
import 'package:peli/ui/theme/my_themes.dart';
import 'package:peli/utils/network_status.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

import 'localization/demo_localizations.dart';
import 'localization/language_constants.dart';
import 'not_found_page.dart';

void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();


  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then(
        (_) => runApp(MyApp()),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  Locale? _locale;

  @override
  void initState(){
    super.initState();

  }

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (this._locale == null) {
      return Container(
        child: Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color?>(Colors.blue[800]))),
      );
    } else {
      return NetworkConnectivity(
        child: StreamProvider<NetworkStatus>(
          initialData: NetworkStatus.Offline,
          create: (context) => NetworkService().networkStatusController.stream,
          child: CustomThemeProvider(
            child: ThemeConsumer(
              child: Builder(
                builder: (themeContext) => MaterialApp.router(
                    routerDelegate: AutoRouterDelegate(_appRouter),
                    routeInformationParser: _appRouter.defaultRouteParser(),
                    theme: ThemeProvider.themeOf(themeContext).data,
                    debugShowCheckedModeBanner: false,
                    title: 'PeLI',
                    locale: _locale,
                    supportedLocales: [
                      Locale('uz', 'UZ'),
                      Locale('ru', 'RU'),
                      Locale('en', 'EN'),
                    ],
                    localizationsDelegates: [
                      DemoLocalization.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    localeResolutionCallback: (locale, supportedLocales) {
                      for (var supportedLocale in supportedLocales) {
                        if (supportedLocale.languageCode ==
                            locale!.languageCode &&
                            supportedLocale.countryCode == locale.countryCode) {
                          return supportedLocale;
                        }
                        print(supportedLocale);
                      }
                      // print(supportedLocales.first);
                      return supportedLocales.first;
                    }
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}

class CustomThemeProvider extends StatelessWidget {
  final Widget? child;

  const CustomThemeProvider({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      defaultThemeId: 'light',
      themes: <AppTheme>[
        AppTheme(id: 'light', data: MyThemes.lightTheme, description: 'light'),
        AppTheme(id: 'dark', data: MyThemes.darkTheme, description: 'dark'),
      ],
      saveThemesOnChange: true,
      loadThemeOnInit: false,
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        String? savedTheme = await previouslySavedThemeFuture;
        if (savedTheme != null) {
          controller.setTheme(savedTheme);
        } else {
          Brightness platformBrightness =
              SchedulerBinding.instance!.window.platformBrightness;
          if (platformBrightness == Brightness.dark) {
            controller.setTheme('dark');
          } else {
            controller.setTheme('light');
          }
          controller.forgetSavedTheme();
        }
      },
      child: child!,
    );
  }
}

class NetworkConnectivity extends StatelessWidget {
  final Widget? child;

  const NetworkConnectivity({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        ConnectivityChangeNotifier changeNotifier =
        ConnectivityChangeNotifier();
        //Initial load is an async function, can use FutureBuilder to show loading
        //screen while this function running. This is not covered in this tutorial
        changeNotifier.initialLoad();
        return changeNotifier;
      },
      child: child,
    );
  }
}