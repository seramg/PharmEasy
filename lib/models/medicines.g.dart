// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medicines _$MedicinesFromJson(Map<String, dynamic> json) => Medicines(
      id: json['id'] as String?,
      name: json['name'] as String?,
      qty: json['qty'] as int?,
      maxqty: json['maxqty'] as int?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MedicinesToJson(Medicines instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'qty': instance.qty,
      'maxqty': instance.maxqty,
      'price': instance.price,
    };
