import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/setting/app_setting.dart';
import '../../repositories/app_setting/app_setting_repository.dart';

part 'app_setting_view_model.g.dart';

@riverpod
class AppSettingViewModel extends _$AppSettingViewModel {
  late final AppSettingRepository repository;
  @override
  AppSetting build() {
    repository = ref.watch(appSettingRepositoryProvider);
    return repository.getAppSetting();
  }

  Future<void> updateAppSetting(
      {String? updatedColor,
      int? updatedFontSize,
      String? updatedLanguate}) async {
    final currentAppSetting = repository.getAppSetting();
    final updatedAppSetting = currentAppSetting.copyWith(
        color: updatedColor ?? currentAppSetting.color,
        fontSize: updatedFontSize ?? currentAppSetting.fontSize,
        language: updatedLanguate ?? currentAppSetting.language);
    await repository.updateAppSetting(updatedAppSetting);
    state = updatedAppSetting;
  }

  bool get isFirstInstalled => repository.checkIsFirstInstalled();
}
