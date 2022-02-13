
import 'package:json_annotation/json_annotation.dart';
part 'medicalstore.g.dart';


@JsonSerializable(explicitToJson: true)
class MedicalStore{
   String? id;
  final String? name;


  MedicalStore({
     this.id,
    required this.name,


  });

  factory MedicalStore.fromJson(Map<String, dynamic> json) => _$MedicalStoreFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalStoreToJson(this);
}
