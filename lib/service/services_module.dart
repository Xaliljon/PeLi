

import 'package:injectable/injectable.dart';
import 'package:peli/utils/user_data.dart';
import 'network_service.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  // ApiProvider get apiProvider;

  @lazySingleton
  // NavigationService get navigationServices;

  @lazySingleton
  // BottomSheetService get bottomSheetService;

  @lazySingleton
  UserData get userData;

  @lazySingleton
  NetworkService get networkService;
}
