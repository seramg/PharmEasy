
import 'package:json_annotation/json_annotation.dart';
import 'package:pharmeasy/models/medicalstore.dart';
part 'user.g.dart';


@JsonSerializable(explicitToJson: true)
class User {
  final String? id;
  final String? name;
  final String? phone;
  final String? email;
  final MedicalStore? medStore;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.medStore

  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
