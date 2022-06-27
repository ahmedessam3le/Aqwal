part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteIsLoading extends RandomQuoteState {}

class RandomQuoteLoaded extends RandomQuoteState {
  final Quote quote;

  @override
  List<Object> get props => [quote];

  RandomQuoteLoaded({required this.quote});
}

class RandomQuoteError extends RandomQuoteState {
  final String error;
  @override
  List<Object> get props => [error];

  RandomQuoteError({required this.error});
}
