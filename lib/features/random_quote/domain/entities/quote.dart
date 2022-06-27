import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final int id;
  final String author;
  final String content;
  final String permalink;

  Quote({
    required this.id,
    required this.author,
    required this.content,
    required this.permalink,
  });

  @override
  List<Object?> get props => [id, author, content, permalink];
}
