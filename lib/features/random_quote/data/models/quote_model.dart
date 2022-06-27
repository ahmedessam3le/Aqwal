import 'package:aqwal/features/random_quote/domain/entities/quote.dart';

class QuoteModel extends Quote {
  QuoteModel({
    required int id,
    required String author,
    required String content,
    required String permalink,
  }) : super(id: id, author: author, content: content, permalink: permalink);

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['id'],
      author: json['author'],
      content: json['quote'],
      permalink: json['permalink'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'quote': content,
      'permalink': permalink,
    };
  }
}
