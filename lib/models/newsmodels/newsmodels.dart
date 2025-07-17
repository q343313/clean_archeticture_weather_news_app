



import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart'; // Required for @freezed

part 'newsmodels.freezed.dart';
part 'newsmodels.g.dart'; // For JSON serialization

@freezed
class NewsApiResponse with _$NewsApiResponse {
  const factory NewsApiResponse({
    required String status,
    required int totalResults,
    required List<Article> articles,
  }) = _NewsApiResponse;

  factory NewsApiResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsApiResponseFromJson(json);
}

@freezed
class Article with _$Article {
  const factory Article({
    required Source source,
    String? author, // Nullable fields
    required String title,
    String? description, // Nullable fields
    required String url,
    String? urlToImage, // Nullable fields
    required String publishedAt,
    String? content, // Nullable fields
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

@freezed
class Source with _$Source {
  const factory Source({
    String? id, // Nullable
    required String name,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) =>
      _$SourceFromJson(json);
}