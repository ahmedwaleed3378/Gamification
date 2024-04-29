// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_files_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitFileResponse _$UnitFileResponseFromJson(Map<String, dynamic> json) =>
    UnitFileResponse(
      unitData: (json['UnitData'] as List<dynamic>?)
          ?.map((e) => UnitFileDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UnitFileResponseToJson(UnitFileResponse instance) =>
    <String, dynamic>{
      'UnitData': instance.unitData,
    };

UnitFileDataResponse _$UnitFileDataResponseFromJson(
        Map<String, dynamic> json) =>
    UnitFileDataResponse(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
      order: json['order'] as int?,
      subjectId: json['subject_id'] as int?,
      subjectArName: json['subject_ar_name'] as String?,
      subjectEnName: json['subject_en_name'] as String?,
      isMandatory: json['isMandatory'] as bool?,
      attach: json['attach'] as String?,
      fileEduUnit: json['FileEduUnit'] as List<dynamic>?,
    );

Map<String, dynamic> _$UnitFileDataResponseToJson(
        UnitFileDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ar_name': instance.arName,
      'en_name': instance.enName,
      'order': instance.order,
      'subject_id': instance.subjectId,
      'subject_ar_name': instance.subjectArName,
      'subject_en_name': instance.subjectEnName,
      'isMandatory': instance.isMandatory,
      'attach': instance.attach,
      'FileEduUnit': instance.fileEduUnit,
    };
