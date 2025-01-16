import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'study_setting.freezed.dart';
part 'study_setting.g.dart';

@freezed
@HiveType(typeId: 11)
class StudySetting with _$StudySetting {
  const factory StudySetting({
    @HiveField(0) @Default(8 * 60 * 60) int goalDuration,
    @HiveField(1) @Default(0) int country,
    @HiveField(2) String? group,
  }) = _StudySetting;

  factory StudySetting.fromJson(Map<String, dynamic> json) =>
      _$StudySettingFromJson(json);
}
