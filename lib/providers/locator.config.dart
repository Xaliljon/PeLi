// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../service/network_service.dart' as _i3;
import '../service/services_module.dart' as _i5;
import '../utils/user_data.dart' as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.NetworkService>(
      () => thirdPartyServicesModule.networkService);
  gh.lazySingleton<_i4.UserData>(() => thirdPartyServicesModule.userData);
  return get;
}

class _$ThirdPartyServicesModule extends _i5.ThirdPartyServicesModule {
  @override
  _i3.NetworkService get networkService => _i3.NetworkService();
  @override
  _i4.UserData get userData => _i4.UserData();
}
