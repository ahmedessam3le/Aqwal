import 'package:aqwal/core/api/api_consumer.dart';
import 'package:aqwal/core/api/end_points.dart';
import 'package:aqwal/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDataSourceContract {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSource
    implements RandomQuoteRemoteDataSourceContract {
  ApiConsumer apiConsumer;

  RandomQuoteRemoteDataSource({required this.apiConsumer});
  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(EndPoints.randomQuote);

    return QuoteModel.fromJson(response);
  }
}
