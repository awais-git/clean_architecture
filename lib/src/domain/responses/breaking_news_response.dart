// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:clean_artitecture/src/domain/models/articles_model.dart';

class BreakingNewsResponse extends Equatable {
  final String status;
  final int totalResults;
  final List<Articles> articles;
  const BreakingNewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  BreakingNewsResponse copyWith({
    String? status,
    int? totalResults,
    List<Articles>? articles,
  }) {
    return BreakingNewsResponse(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }

  factory BreakingNewsResponse.fromMap(Map<String, dynamic> map) {
    return BreakingNewsResponse(
      status: map['status'] as String,
      totalResults: map['totalResults'],
      articles: List<Articles>.from(
        (map['articles'] as List<dynamic>).map<Articles>(
          (e) => Articles.fromMap(e as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory BreakingNewsResponse.fromJson(String source) =>
      BreakingNewsResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, totalResults, articles];
}
