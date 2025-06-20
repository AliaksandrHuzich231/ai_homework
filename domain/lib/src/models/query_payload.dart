part of models;

final class QueryPayload {
  final int limit;
  final int offset;
  final String? query;

  const QueryPayload({
    required this.limit,
    required this.offset,
    this.query,
  });

  factory QueryPayload.initial() {
    return const QueryPayload(
      limit: 20,
      offset: 0,
      query: null,
    );
  }

  QueryPayload copyWith({
    int? limit,
    int? offset,
    String? query,
  }) {
    return QueryPayload(
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      query: query ?? this.query,
    );
  }
}
