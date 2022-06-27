import 'package:aqwal/core/errors/failure.dart';
import 'package:aqwal/features/random_quote/domain/entities/quote.dart';
import 'package:dartz/dartz.dart';

abstract class QuoteRepositoryContract {
  Future<Either<Failure, Quote>> getRandomQuote();
}
