// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicinesShort.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicinesShort _$MedicinesShortFromJson(Map<String, dynamic> json) =>
    MedicinesShort(
      id: json['id'] as String?,
      name: json['name'] as String,
      qty: json['qty'] as int,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MedicinesShortToJson(MedicinesShort instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'qty': instance.qty,
      'price': instance.price,
    };
