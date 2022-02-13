// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Requests _$RequestsFromJson(Map<String, dynamic> json) => Requests(
      id: json['id'] as String?,
      salesman: json['salesman'] == null
          ? null
          : User.fromJson(json['salesman'] as Map<String, dynamic>),
      pharmacist: json['pharmacist'] == null
          ? null
          : User.fromJson(json['pharmacist'] as Map<String, dynamic>),
      medicalStore: json['medicalStore'] == null
          ? null
          : MedicalStore.fromJson(json['medicalStore'] as Map<String, dynamic>),
      med: (json['med'] as List<dynamic>)
          .map((e) => Medicines.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestsToJson(Requests instance) => <String, dynamic>{
      'id': instance.id,
      'salesman': instance.salesman?.toJson(),
      'pharmacist': instance.pharmacist?.toJson(),
      'medicalStore': instance.medicalStore?.toJson(),
      'med': instance.med.map((e) => e.toJson()).toList(),
    };
