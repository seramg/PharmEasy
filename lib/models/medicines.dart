
import 'package:json_annotation/json_annotation.dart';
part 'medicines.g.dart';


@JsonSerializable(explicitToJson: true)
class Medicines {
  final String? id;
  final String? name;
  final int? qty;
  final int? maxqty;
  final double? price;

  Medicines({
    required this.id,
    required this.name,
    required this.qty,
    required this.maxqty,
    required this.price

  });

  factory Medicines.fromJson(Map<String, dynamic> json) => _$MedicinesFromJson(json);
  Map<String, dynamic> toJson() => _$MedicinesToJson(this);
}
