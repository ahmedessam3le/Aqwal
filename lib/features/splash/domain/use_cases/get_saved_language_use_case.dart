import 'package:aqwal/core/errors/failure.dart';
import 'package:aqwal/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../repositories/language_repository_contract.dart';

class GetSavedLanguageUseCase implements UseCase<String?, NoParams> {
  final LanguageRepositoryContract languageRepository;

  GetSavedLanguageUseCase({required this.languageRepository});
  @override
  Future<Either<Failure, String?>> call(NoParams params) async {
    return await languageRepository.getSavedLanguage();
  }
}
