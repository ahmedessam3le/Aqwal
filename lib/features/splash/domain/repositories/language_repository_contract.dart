import 'package:aqwal/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class LanguageRepositoryContract {
  Future<Either<Failure, bool>> changeLanguage({required String languageCode});
  Future<Either<Failure, String?>> getSavedLanguage();
}
