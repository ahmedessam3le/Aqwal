import 'package:aqwal/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LanguageLocaleDataSourceContract {
  Future<bool> changeLanguage({required String languageCode});
  Future<String?> getSavedLanguage();
}

class LanguageLocaleDataSource implements LanguageLocaleDataSourceContract {
  final SharedPreferences sharedPreferences;

  LanguageLocaleDataSource({required this.sharedPreferences});
  @override
  Future<bool> changeLanguage({required String languageCode}) async {
    return await sharedPreferences.setString(AppStrings.locale, languageCode);
  }

  @override
  Future<String?> getSavedLanguage() async {
    return sharedPreferences.getString(AppStrings.locale) ??
        AppStrings.englishCode;
  }
}
