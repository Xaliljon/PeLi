import 'dart:developer';

import "package:shared_preferences/shared_preferences.dart";

class UserData {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Object? getUserData(var key) {
    var object;
    _prefs.then((SharedPreferences prefs) {
      object = (prefs.getString(key) ?? 'value(-72)');
    });
    return object;
  }

  Future<void> saveRentToken(String token, String refresh) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('rentToken', token);
    prefs.setString('rentTokenRefresh', refresh);
  }

  Future<String?> getRentToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('rentToken');
  }

  Future<String?> getRentRefreshToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('rentTokenRefresh');
  }

  Future<void> setAppLaunched(bool launched) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('appLaunched', launched);
  }

  Future<bool> getAppLaunched() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('appLaunched') ?? false;
  }

  Future<void> setSelfEmployAccess(bool access) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('self_employ_access', access);
  }

  Future<String?> getSelfEmployAccess() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('self_employ_access');
  }

  Future<void> setToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('token');
  }

  Future<void> setLang(String lang) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('lang', lang);
  }

  Future<String?> getLang() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('lang');
  }


  Future<void> setTheme(String theme) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('theme', theme);
  }

  Future<String?> getTheme() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('theme') ?? 'light';
  }



  Future<int?> getAuth() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt('auth');
  }

  Future<void> setLanguageSelected(bool value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('languageSelected', value);
  }

  Future<bool?> getLanguageSelected() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('languageSelected') ?? false;
  }


  Future<String> getUserPhone() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('userPhoneNumber') ?? "";
  }

  Future<String> getStatus() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('physicalPersonTaxationStatus') ?? "";
  }

  Future<void> saveFavouriteList(String listString, int auth) async {
    final SharedPreferences prefs = await _prefs;
    switch(auth){
      case 1:
        prefs.setString('physFavourite', listString);
        break;
      case 2:
        prefs.setString('yurFavourite', listString);
        break;
      case 3:
        prefs.setString('yattFavourite', listString);
        break;
      default:
        prefs.setString('selfFavourite', listString);
        break;
    }
  }

  Future<String?> getFavouriteList(int auth) async {
    final SharedPreferences prefs = await _prefs;
    String? result;
    switch(auth){
      case 1:
        result = prefs.getString('physFavourite');
        break;
      case 2:
        result = prefs.getString('yurFavourite');
        break;
      case 3:
        result = prefs.getString('yattFavourite');
        break;
      default:
        result = prefs.getString('selfFavourite');
        break;
    }
    return result;
  }



  Future<void> saveHistoryChekPhone(String phone) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('savedHistoryChekPhone', phone);
  }

  Future<String?> getHistoryChekPhone() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('savedHistoryChekPhone');
  }

  Future<void> clearHistoryChekPhone() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove("savedHistoryChekPhone");
  }

}
