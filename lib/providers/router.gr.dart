// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/cupertino.dart' as _i9;
import 'package:flutter/material.dart' as _i8;

import '../not_found_page.dart' as _i1;
import '../views/main_page/main_page.dart' as _i6;
import '../views/settings/settings_page.dart' as _i5;
import '../views/splash_page/auth_page.dart' as _i4;
import '../views/splash_page/splash_screen.dart' as _i2;
import '../views/splash_page/splash_settings.dart' as _i3;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    NotFoundPageRoute.name: (routeData) {
      final args = routeData.argsAs<NotFoundPageRouteArgs>(
          orElse: () => const NotFoundPageRouteArgs());
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: _i1.NotFoundPage(key: args.key));
    },
    SplashScreenRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: _i2.SplashScreen());
    },
    SplashSettingsRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i3.SplashSettings());
    },
    AuthPageRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: _i4.AuthPage());
    },
    SettingsPageRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsPageRouteArgs>(
          orElse: () => const SettingsPageRouteArgs());
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData,
          child:
              _i5.SettingsPage(key: args.key, isAppBarIcon: args.isAppBarIcon));
    },
    MainPageRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: _i6.MainPage());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(NotFoundPageRoute.name, path: '/not-found-page'),
        _i7.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i7.RouteConfig(SplashSettingsRoute.name, path: '/splash-settings'),
        _i7.RouteConfig(AuthPageRoute.name, path: '/auth-page'),
        _i7.RouteConfig(SettingsPageRoute.name, path: '/settings-page'),
        _i7.RouteConfig(MainPageRoute.name, path: '/main-page')
      ];
}

/// generated route for [_i1.NotFoundPage]
class NotFoundPageRoute extends _i7.PageRouteInfo<NotFoundPageRouteArgs> {
  NotFoundPageRoute({_i9.Key? key})
      : super(name,
            path: '/not-found-page', args: NotFoundPageRouteArgs(key: key));

  static const String name = 'NotFoundPageRoute';
}

class NotFoundPageRouteArgs {
  const NotFoundPageRouteArgs({this.key});

  final _i9.Key? key;
}

/// generated route for [_i2.SplashScreen]
class SplashScreenRoute extends _i7.PageRouteInfo<void> {
  const SplashScreenRoute() : super(name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for [_i3.SplashSettings]
class SplashSettingsRoute extends _i7.PageRouteInfo<void> {
  const SplashSettingsRoute() : super(name, path: '/splash-settings');

  static const String name = 'SplashSettingsRoute';
}

/// generated route for [_i4.AuthPage]
class AuthPageRoute extends _i7.PageRouteInfo<void> {
  const AuthPageRoute() : super(name, path: '/auth-page');

  static const String name = 'AuthPageRoute';
}

/// generated route for [_i5.SettingsPage]
class SettingsPageRoute extends _i7.PageRouteInfo<SettingsPageRouteArgs> {
  SettingsPageRoute({_i9.Key? key, bool? isAppBarIcon})
      : super(name,
            path: '/settings-page',
            args: SettingsPageRouteArgs(key: key, isAppBarIcon: isAppBarIcon));

  static const String name = 'SettingsPageRoute';
}

class SettingsPageRouteArgs {
  const SettingsPageRouteArgs({this.key, this.isAppBarIcon});

  final _i9.Key? key;

  final bool? isAppBarIcon;
}

/// generated route for [_i6.MainPage]
class MainPageRoute extends _i7.PageRouteInfo<void> {
  const MainPageRoute() : super(name, path: '/main-page');

  static const String name = 'MainPageRoute';
}
