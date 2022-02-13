
import 'package:json_annotation/json_annotation.dart';

import 'medicinesShort.dart';
part 'orders.g.dart';


@JsonSerializable(explicitToJson: true)
class Orders {
  final String? id;
  final String? customer;
  final DateTime? date;
  final List<MedicinesShort> ? med;
  final double? total;

  Orders({
    required this.id,
    required this.customer,
    required this.date,
    required this.med,
    required this.total

  });

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);
  Map<String, dynamic> toJson() => _$OrdersToJson(this);
}
