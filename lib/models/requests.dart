
import 'package:json_annotation/json_annotation.dart';
import 'package:pharmeasy/models/medicalstore.dart';
import 'package:pharmeasy/models/medicines.dart';
import 'package:pharmeasy/models/user.dart';
part 'requests.g.dart';


@JsonSerializable(explicitToJson: true)
class Requests {
  final String? id;
  final User? salesman;
  final User? pharmacist;
  final MedicalStore? medicalStore;
  final List<Medicines> med;

  Requests({
    required this.id,
    required this.salesman,
    required this.pharmacist,
    required this.medicalStore,
    required this.med

  });

  factory Requests.fromJson(Map<String, dynamic> json) => _$RequestsFromJson(json);
  Map<String, dynamic> toJson() => _$RequestsToJson(this);
}
