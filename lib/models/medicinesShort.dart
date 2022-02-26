
import 'package:json_annotation/json_annotation.dart';
part 'medicinesShort.g.dart';


@JsonSerializable(explicitToJson: true)
class MedicinesShort {
   String? id;
  final String name;
  final int qty;

  final double price;

  MedicinesShort({
     this.id,
   required  this.name,
  required   this.qty,
     required this.price

  });

  factory MedicinesShort.fromJson(Map<String, dynamic> json) => _$MedicinesShortFromJson(json);
  Map<String, dynamic> toJson() => _$MedicinesShortToJson(this);
}
