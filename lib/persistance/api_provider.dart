import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:peli/providers/locator.dart';
import 'package:peli/utils/user_data.dart';
import 'package:stacked_services/stacked_services.dart';

import 'exceptions.dart';

class ApiProvider {
  Client client = Client();
  UserData _userData = UserData();
  NavigationService? navigationService = locator<NavigationService>();
  BuildContext? context;

  final baseUrl = 'https://my.soliq.uz/';

  Future<List<String?>> getPortableSalesObjects(String? lang) async {
    var _langCode;
    List<String?> _responseJson = [];
    switch (lang) {
      case "uz":
        _langCode = "nameUz";
        break;
      case "ru":
        _langCode = "nameRu";
        break;
      case "en":
        _langCode = "name";
        break;

      default:
        _langCode = "name";
        break;
    }


    return _responseJson;
  }

  Future<List<String?>> getPortableSalesProducts(String? lang) async {
    var _langCode;
    List<String?> _responseJson = [];
    switch (lang) {
      case "uz":
        _langCode = "nameUz";
        break;
      case "ru":
        _langCode = "nameRu";
        break;
      case "en":
        _langCode = "name";
        break;

      default:
        _langCode = "name";
        break;
    }


    return _responseJson;
  }

  static String getBaseAuth() {
    String username = 'mobileapp';
    String password = '76b0#1fd088a301\$';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    return basicAuth;
  }

  static String getBaseCashbackAuth() {
    String username = 'mysoliq-cashback-one-api';
    String password = 'cashbackoneapi123\$';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    return basicAuth;
  }

  static String getNotificationAuth() {
    String username = 'fiz_service_user';
    String password = 'BA81D732ABXC27CDAE053X0A08A8C0125C';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    return basicAuth;
  }

  static String basicRegAuthOfdCheck() {
    String username = 'soliq_uz';
    String password = 'Qwerty123\$';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    return basicAuth;
  }

  static String basicAuthOfdCheck() {
    String username = 'mobile';
    String password = 'qazxswe123\$';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    return basicAuth;
  }

  String getVitrinaAuth() {
    String username = 'vitrina';
    String password = '321654';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    return basicAuth;
  }

  String getInspectorAuth() {
    String username = 'ofdinspector';
    String password = 'ofdinspector!@2020';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    return basicAuth;
  }
}
