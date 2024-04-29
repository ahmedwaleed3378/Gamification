// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitDataResponse _$UnitDataResponseFromJson(Map<String, dynamic> json) =>
    UnitDataResponse(
      unitData: json['UnitData'] == null
          ? null
          : UnitDataContentResponse.fromJson(
              json['UnitData'] as Map<String, dynamic>),
      model: (json['model'] as List<dynamic>?)
          ?.map(
              (e) => UnitDataModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      completePercentageUnit: json['CompletePercentageUnit'],
    );

Map<String, dynamic> _$UnitDataResponseToJson(UnitDataResponse instance) =>
    <String, dynamic>{
      'UnitData': instance.unitData,
      'model': instance.model,
      'CompletePercentageUnit': instance.completePercentageUnit,
    };

UnitDataContentResponse _$UnitDataContentResponseFromJson(
        Map<String, dynamic> json) =>
    UnitDataContentResponse(
      unitId: json['unitId'] as int?,
      unitArName: json['unit_ar_name'] as String?,
      unitEnName: json['unit_en_name'] as String?,
      subjectId: json['subjectid'] as int?,
      subjectArName: json['subject_ar_name'] as String?,
      subjectEnName: json['subject_en_name'] as String?,
      isMandatory: json['isMandatory'],
      orderNum: json['orderNum'] as int?,
      attach: json['attach'] as String?,
    );

Map<String, dynamic> _$UnitDataContentResponseToJson(
        UnitDataContentResponse instance) =>
    <String, dynamic>{
      'unitId': instance.unitId,
      'unit_ar_name': instance.unitArName,
      'unit_en_name': instance.unitEnName,
      'subjectid': instance.subjectId,
      'subject_ar_name': instance.subjectArName,
      'subject_en_name': instance.subjectEnName,
      'isMandatory': instance.isMandatory,
      'orderNum': instance.orderNum,
      'attach': instance.attach,
    };

UnitDataModelResponse _$UnitDataModelResponseFromJson(
        Map<String, dynamic> json) =>
    UnitDataModelResponse(
      type: json['type'] as String?,
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
      order: json['order'] as int?,
      examTypeId: json['exam_type_id'] as int?,
      periodMinute: json['period_minute'] as int?,
      isMandatory: json['isMandatory'] as bool? ?? false,
      availableDateFrom: json['availableDateFrom'] as String?,
      availableDateTo: json['availableDateTo'] as String?,
      isPublish: json['IsPublish'],
      fromHour: json['fromHour'] as String?,
      toHour: json['ToHour'] as String?,
      percentageToPass: json['percentageToPass'] as int?,
      isComplete: json['isComplete'] as bool?,
      numViews: json['Num_Views'] as int?,
      attachTypeId: json['attachTypeId'] as int?,
      attachTypeName: json['attachTypeName'] as String?,
      fileTypeId: json['FileTypeId'] as int?,
      fileTypeName: json['FileTypeName'] as String?,
      attach: json['attach'] as String?,
      isOnline: json['isOnline'] as bool?,
    );

Map<String, dynamic> _$UnitDataModelResponseToJson(
        UnitDataModelResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'ar_name': instance.arName,
      'en_name': instance.enName,
      'order': instance.order,
      'exam_type_id': instance.examTypeId,
      'period_minute': instance.periodMinute,
      'isMandatory': instance.isMandatory,
      'availableDateFrom': instance.availableDateFrom,
      'availableDateTo': instance.availableDateTo,
      'IsPublish': instance.isPublish,
      'fromHour': instance.fromHour,
      'ToHour': instance.toHour,
      'percentageToPass': instance.percentageToPass,
      'isComplete': instance.isComplete,
      'Num_Views': instance.numViews,
      'attachTypeId': instance.attachTypeId,
      'attachTypeName': instance.attachTypeName,
      'FileTypeId': instance.fileTypeId,
      'FileTypeName': instance.fileTypeName,
      'attach': instance.attach,
      'isOnline': instance.isOnline,
    };
