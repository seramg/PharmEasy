// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      id: json['id'] as String?,
      med: (json['med'] as List<dynamic>)
          .map((e) => MedicinesShort.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'id': instance.id,
      'med': instance.med.map((e) => e.toJson()).toList(),
      'total': instance.total,
    };
