import 'dart:convert';

import 'package:aqwal/core/errors/exceptions.dart';
import 'package:aqwal/core/utils/app_strings.dart';
import 'package:aqwal/features/random_quote/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQuoteLocalDataSourceContract {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quoteModel);
}

class RandomQuoteLocalDataSource implements RandomQuoteLocalDataSourceContract {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSource({required this.sharedPreferences});
  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomQuote);

    if (jsonString != null) {
      final cachedRandomQuote =
          Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cachedRandomQuote;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheQuote(QuoteModel quoteModel) {
    return sharedPreferences.setString(
        AppStrings.cachedRandomQuote, json.encode(quoteModel));
  }
}
