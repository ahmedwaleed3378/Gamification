// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectUnitResponse _$SubjectUnitResponseFromJson(Map<String, dynamic> json) =>
    SubjectUnitResponse(
      unitId: json['unitId'] as int?,
      subjectId: json['subjectid'] as int?,
      unitArName: json['unit_ar_name'] as String?,
      unitEnName: json['unit_en_name'] as String?,
      subjectArName: json['subject_ar_name'] as String?,
      subjectEnName: json['subject_en_name'] as String?,
      content: (json['content'] as List<dynamic>?)
          ?.map(
              (e) => UnitDataModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderNum: json['orderNum'] as int?,
      isMandatory: json['isMandatory'] as bool?,
    );

Map<String, dynamic> _$SubjectUnitResponseToJson(
        SubjectUnitResponse instance) =>
    <String, dynamic>{
      'unitId': instance.unitId,
      'subjectid': instance.subjectId,
      'unit_ar_name': instance.unitArName,
      'unit_en_name': instance.unitEnName,
      'subject_ar_name': instance.subjectArName,
      'subject_en_name': instance.subjectEnName,
      'content': instance.content,
      'orderNum': instance.orderNum,
      'isMandatory': instance.isMandatory,
    };
