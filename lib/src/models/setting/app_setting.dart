import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'app_setting.freezed.dart';
part 'app_setting.g.dart';

@freezed
@HiveType(typeId: 12)
class AppSetting with _$AppSetting {
  const factory AppSetting({
    @HiveField(0)
    @Default('227C9D')
    String color, //TODO: 디폴트 값 차후 앱 테마 색상 결정하면 수정
    @HiveField(1) @Default(4) int fontSzie,
    @HiveField(2) @Default('ko') String language,
  }) = _AppSetting;

  factory AppSetting.fromJson(Map<String, dynamic> json) =>
      _$AppSettingFromJson(json);
}
