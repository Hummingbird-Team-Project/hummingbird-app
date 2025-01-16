import 'package:hive/hive.dart';

import '../../../models/setting/app_setting.dart';

class AppSettingLocalDatasource {
  AppSettingLocalDatasource(this._box);

  final Box<AppSetting> _box;

  String get _key => 'appSetting';

  AppSetting getAppSetting() {
    try {
      final appSetting = _box.get(_key);
      return appSetting ?? AppSetting();
    } catch (e) {
      return AppSetting();
    }
  }

  Future<void> updateAppSetting(AppSetting updatedAppSetting) async {
    await _box.put(_key, updatedAppSetting);
  }
}
