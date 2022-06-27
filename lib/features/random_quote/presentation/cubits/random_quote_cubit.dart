import 'package:aqwal/core/errors/failure.dart';
import 'package:aqwal/core/use_cases/use_case.dart';
import 'package:aqwal/core/utils/app_strings.dart';
import 'package:aqwal/features/random_quote/domain/entities/quote.dart';
import 'package:aqwal/features/random_quote/domain/use_cases/get_random_quote.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuote getRandomQuoteUseCase;

  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());

  // static RandomQuoteCubit of(BuildContext context) => BlocProvider.of(context);

  Future<void> getRandomQuote() async {
    emit(RandomQuoteIsLoading());
    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());

    emit(
      response.fold(
        (failure) => RandomQuoteError(error: _mapFailureToMessage(failure)),
        (quote) => RandomQuoteLoaded(quote: quote),
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unExpectedError;
    }
  }
}
