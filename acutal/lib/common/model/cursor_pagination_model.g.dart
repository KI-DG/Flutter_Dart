// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursor_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CursorPagination<T> _$CursorPaginationFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    CursorPagination<T>(
      Meta: CursorPaginationMeta.fromJson(json['Meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$CursorPaginationToJson<T>(
  CursorPagination<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'Meta': instance.Meta,
      'data': instance.data.map(toJsonT).toList(),
    };

CursorPaginationMeta _$CursorPaginationMetaFromJson(
        Map<String, dynamic> json) =>
    CursorPaginationMeta(
      count: json['count'] as int,
      hasMore: json['hasMore'] as bool,
    );

Map<String, dynamic> _$CursorPaginationMetaToJson(
        CursorPaginationMeta instance) =>
    <String, dynamic>{
      'count': instance.count,
      'hasMore': instance.hasMore,
    };
