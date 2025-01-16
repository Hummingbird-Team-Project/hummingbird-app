import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hummingbird/src/models/setting/app_setting.dart';
import 'package:hummingbird/src/models/setting/study_setting.dart';
import 'package:hummingbird/src/models/token_model.dart';
import 'package:path_provider/path_provider.dart';

import '../core/const/box_keys.dart';
import 'models/d_day/d_day.dart';
import 'models/study_record/study_record.dart';
import 'models/subject/subject.dart';

Future<void> appInitialize() async {
  final directory = await getApplicationDocumentsDirectory();
  const secureStorage = FlutterSecureStorage();
  var containsEncryptionKey =
      await secureStorage.containsKey(key: BoxKeys.encryptionBoxKey);

  if (!containsEncryptionKey) {
    var key = Hive.generateSecureKey();
    await secureStorage.write(
        key: BoxKeys.encryptionBoxKey, value: base64UrlEncode(key));
  }

  var key = base64Url.decode(
      await secureStorage.read(key: BoxKeys.encryptionBoxKey) as String);

  await Hive.initFlutter(directory.path);
  Hive.registerAdapter(TokenModelAdapter());
  Hive.registerAdapter(DDayAdapter());

  await Hive.openBox<TokenModel>(BoxKeys.tokenBoxKey,
      encryptionCipher: HiveAesCipher(key));

  await Hive.openBox<List<int>>(BoxKeys.suduckBoxKey);
  await Hive.openBox<DDay>(BoxKeys.dDayBoxKey);

  Hive.registerAdapter(SubjectAdapter());
  await Hive.openBox<Subject>(BoxKeys.subjectBoxKey);

  Hive.registerAdapter(StudyRecordAdapter());
  // await Hive.deleteBoxFromDisk(BoxKeys.studyRecordBoxkey);
  await Hive.openBox<List<StudyRecord>>(BoxKeys.studyRecordBoxkey);

  Hive.registerAdapter(StudySettingAdapter());
  await Hive.openBox<StudySetting>(BoxKeys.studySettingBoxKey);

  Hive.registerAdapter(AppSettingAdapter());
  await Hive.openBox<AppSetting>(BoxKeys.appSettingBoxKey);
}
