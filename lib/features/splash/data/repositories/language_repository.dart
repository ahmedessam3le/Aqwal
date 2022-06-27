import 'package:aqwal/core/errors/exceptions.dart';
import 'package:aqwal/core/errors/failure.dart';
import 'package:aqwal/features/splash/data/data_sources/language_locale_data_source.dart';
import 'package:aqwal/features/splash/domain/repositories/language_repository_contract.dart';
import 'package:dartz/dartz.dart';

class LanguageRepository implements LanguageRepositoryContract {
  final LanguageLocaleDataSourceContract languageLocaleDataSourceContract;

  LanguageRepository({required this.languageLocaleDataSourceContract});
  @override
  Future<Either<Failure, bool>> changeLanguage(
      {required String languageCode}) async {
    try {
      return Right(await languageLocaleDataSourceContract.changeLanguage(
          languageCode: languageCode));
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> getSavedLanguage() async {
    try {
      return Right(await languageLocaleDataSourceContract.getSavedLanguage());
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }
}
