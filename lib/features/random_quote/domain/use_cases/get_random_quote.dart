import 'package:aqwal/core/errors/failure.dart';
import 'package:aqwal/core/use_cases/use_case.dart';
import 'package:aqwal/features/random_quote/domain/entities/quote.dart';
import 'package:aqwal/features/random_quote/domain/repositories/quote_repository_contract.dart';
import 'package:dartz/dartz.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {
  final QuoteRepositoryContract quoteRepository;

  GetRandomQuote({required this.quoteRepository});
  @override
  Future<Either<Failure, Quote>> call(NoParams params) {
    return quoteRepository.getRandomQuote();
  }
}
