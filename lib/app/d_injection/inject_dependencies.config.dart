// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:radio_house/controller/favorite_station/favorite_station_controller.dart'
    as _i10;
import 'package:radio_house/controller/filter/filter_controller.dart' as _i6;
import 'package:radio_house/controller/station/station_controller.dart' as _i9;
import 'package:radio_house/repository/database/database_client.dart' as _i3;
import 'package:radio_house/repository/dio/dio_client.dart' as _i4;
import 'package:radio_house/repository/favorite_station/favorite_station_repository.dart'
    as _i8;
import 'package:radio_house/repository/filter/filter_repository.dart' as _i5;
import 'package:radio_house/repository/station/station_repository.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.DatabaseClient>(() => _i3.DatabaseClient());
    gh.lazySingleton<_i4.DioClient>(() => _i4.DioClient());
    gh.lazySingleton<_i5.FilterRepository>(
        () => _i5.FilterRepositoryImpl(gh<_i4.DioClient>()));
    gh.lazySingleton<_i6.FilterController>(
        () => _i6.FilterControllerImpl(gh<_i5.FilterRepository>()));
    gh.lazySingleton<_i7.StationRepository>(
        () => _i7.StationRepositoryImpl(gh<_i4.DioClient>()));
    gh.lazySingleton<_i8.FavoriteStationRepository>(
        () => _i8.FavoriteStationRepositoryImpl(gh<_i3.DatabaseClient>()));
    gh.lazySingleton<_i9.StationController>(
        () => _i9.StationControllerImpl(gh<_i7.StationRepository>()));
    gh.lazySingleton<_i10.FavoriteStationController>(() =>
        _i10.FavoriteStationControllerImpl(
            gh<_i8.FavoriteStationRepository>()));
    return this;
  }
}
