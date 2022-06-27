import 'package:aqwal/core/errors/failure.dart';
import 'package:aqwal/core/use_cases/use_case.dart';
import 'package:aqwal/features/splash/domain/repositories/language_repository_contract.dart';
import 'package:dartz/dartz.dart';

class ChangeLanguageUseCase implements UseCase<bool, String> {
  final LanguageRepositoryContract languageRepository;

  ChangeLanguageUseCase({required this.languageRepository});
  @override
  Future<Either<Failure, bool>> call(String languageCode) async {
    return await languageRepository.changeLanguage(languageCode: languageCode);
  }
}
