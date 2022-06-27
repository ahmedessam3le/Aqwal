part of 'locale_cubit.dart';

abstract class LocaleStates extends Equatable {
  final Locale locale;
  const LocaleStates(this.locale);

  @override
  List<Object> get props => [locale];
}

class ChangeLocalState extends LocaleStates {
  ChangeLocalState(Locale selectedLocale) : super(selectedLocale);
}
