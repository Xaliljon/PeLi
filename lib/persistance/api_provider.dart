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

  final baseUrl = '';

}
