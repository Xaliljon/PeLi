import 'package:auto_route/auto_route.dart';
import 'package:peli/not_found_page.dart';
import 'package:peli/views/main_page/main_page.dart';
import 'package:peli/views/settings/settings_page.dart';
import 'package:peli/views/splash_page/auth_page.dart';
import 'package:peli/views/splash_page/splash_screen.dart';
import 'package:peli/views/splash_page/splash_settings.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CupertinoRoute(page: NotFoundPage),

    //Main page routes
    CupertinoRoute(page: SplashScreen, initial: true),
    CupertinoRoute(page: SplashSettings),
    CupertinoRoute(page: AuthPage),
    CupertinoRoute(page: SettingsPage),
    CupertinoRoute(page: MainPage),
  ],
)
class $AppRouter {}
