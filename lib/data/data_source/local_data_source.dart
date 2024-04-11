import 'dart:convert';
import '../../app/app_prefs.dart';
import '../../domain/models/list_model.dart';

abstract class LocalDataSource {
  Future<void> saveLoginDataPref({required String response});
}

class LocalDataSourceImplementer implements LocalDataSource {
  final AppPrefs appPrefs;
  LocalDataSourceImplementer({
    required this.appPrefs,
  });
  @override
  Future<void> saveLoginDataPref({required String response}) async {
    //appPrefs.setPrefStringValue(prefsKeyPopularData, response);
  }
}
