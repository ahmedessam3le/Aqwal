import 'package:aqwal/core/use_cases/use_case.dart';
import 'package:aqwal/core/utils/app_strings.dart';
import 'package:aqwal/features/splash/domain/use_cases/change_language_use_case.dart';
import 'package:aqwal/features/splash/domain/use_cases/get_saved_language_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleStates> {
  final GetSavedLanguageUseCase getSavedLanguageUseCase;
  final ChangeLanguageUseCase changeLanguageUseCase;
  LocaleCubit({
    required this.getSavedLanguageUseCase,
    required this.changeLanguageUseCase,
  }) : super(ChangeLocalState(Locale(AppStrings.englishCode)));

  String currentLanguageCode = AppStrings.englishCode;

  Future<void> getSavedLanguage() async {
    final response = await getSavedLanguageUseCase(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLanguageCode = value!;
      emit(ChangeLocalState(Locale(currentLanguageCode)));
    });
  }

  Future<void> _changeLanguage(String languageCode) async {
    final response = await changeLanguageUseCase(languageCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLanguageCode = languageCode;
      emit(ChangeLocalState(Locale(currentLanguageCode)));
    });
  }

  void toEnglish() => _changeLanguage(AppStrings.englishCode);
  void toArabic() => _changeLanguage(AppStrings.arabicCode);
}
