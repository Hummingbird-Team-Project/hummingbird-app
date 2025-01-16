import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/const/box_keys.dart';
import '../../datasource/local/app_setting/app_setting_local_datasource.dart';
import '../../models/setting/app_setting.dart';

part 'app_setting_repository.g.dart';

@riverpod
AppSettingRepository appSettingRepository(Ref ref) {
  final box = Hive.box<AppSetting>(BoxKeys.appSettingBoxKey);
  final appSettingLocalDataSource = AppSettingLocalDatasource(box);
  return AppSettingRepository(appSettingLocalDataSource);
}

class AppSettingRepository {
  AppSettingRepository(this.localDataSource);

  AppSettingLocalDatasource localDataSource;

  AppSetting getAppSetting() {
    return localDataSource.getAppSetting();
  }

  Future<void> updateAppSetting(AppSetting updatedAppSetting) async {
    await localDataSource.updateAppSetting(updatedAppSetting);
  }
}
