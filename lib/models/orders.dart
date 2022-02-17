
import 'package:json_annotation/json_annotation.dart';

import 'medicinesShort.dart';
part 'orders.g.dart';


@JsonSerializable(explicitToJson: true)
class Orders {
   String? id;
  final List<MedicinesShort>  med;
  final double? total;

  Orders({
     this.id,

  required   this.med,
     this.total

  });

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);
  Map<String, dynamic> toJson() => _$OrdersToJson(this);
}
