import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cursor_pagination_model.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
)
class CursorPagination<T>  {
  final CursorPaginationMeta Meta;
  final List<T> data;

  CursorPagination({
    required this.Meta,
    required this.data,
});
  factory CursorPagination.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT)
  => _$CursorPaginationFromJson(json, fromJsonT);
}


@JsonSerializable()
class CursorPaginationMeta{
  final int count;
  final bool hasMore;

  CursorPaginationMeta({
    required this.count,
    required this.hasMore,
});
  factory CursorPaginationMeta.fromJson(Map<String, dynamic> json)
  => _$CursorPaginationMetaFromJson(json);
}