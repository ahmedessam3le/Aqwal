import 'package:aqwal/core/errors/exceptions.dart';
import 'package:aqwal/core/errors/failure.dart';
import 'package:aqwal/core/network/network_info.dart';
import 'package:aqwal/features/random_quote/data/data_sources/random_quote_local_data_source.dart';
import 'package:aqwal/features/random_quote/data/data_sources/random_quote_remote_data_source.dart';
import 'package:aqwal/features/random_quote/domain/entities/quote.dart';
import 'package:aqwal/features/random_quote/domain/repositories/quote_repository_contract.dart';
import 'package:dartz/dartz.dart';

class QuoteRepository implements QuoteRepositoryContract {
  final NetworkInfoContract networkInfo;
  final RandomQuoteRemoteDataSourceContract randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSourceContract randomQuoteLocalDataSource;

  QuoteRepository({
    required this.randomQuoteRemoteDataSource,
    required this.randomQuoteLocalDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected()) {
      try {
        final remoteRandomQuote =
            await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
        return Right(remoteRandomQuote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cacheRandomQuote =
            await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(cacheRandomQuote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
