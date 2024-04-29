// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_parts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LecturePartsResponse _$LecturePartsResponseFromJson(
        Map<String, dynamic> json) =>
    LecturePartsResponse(
      model: json['model'] == null
          ? null
          : ModelResponse.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LecturePartsResponseToJson(
        LecturePartsResponse instance) =>
    <String, dynamic>{
      'model': instance.model,
    };

ModelResponse _$ModelResponseFromJson(Map<String, dynamic> json) =>
    ModelResponse(
      material: json['material'] == null
          ? null
          : MaterialResponse.fromJson(json['material'] as Map<String, dynamic>),
      isMaterialAvaliable: json['IsMaterialAvaliable'] as bool?,
      parts: (json['parts'] as List<dynamic>?)
          ?.map((e) => PartsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      userID: json['userID'] as int?,
      examsSolved: json['ExamsSolved'] as bool?,
    );

Map<String, dynamic> _$ModelResponseToJson(ModelResponse instance) =>
    <String, dynamic>{
      'material': instance.material,
      'IsMaterialAvaliable': instance.isMaterialAvaliable,
      'parts': instance.parts,
      'userID': instance.userID,
      'ExamsSolved': instance.examsSolved,
    };

MaterialResponse _$MaterialResponseFromJson(Map<String, dynamic> json) =>
    MaterialResponse(
      id: json['id'] as int?,
      isMandatory: json['isMandatory'] as bool?,
      state: json['state'] as bool?,
      materialName: json['material_name'] as String?,
      isAvaliable: json['IsAvaliable'] as bool?,
    );

Map<String, dynamic> _$MaterialResponseToJson(MaterialResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isMandatory': instance.isMandatory,
      'state': instance.state,
      'material_name': instance.materialName,
      'IsAvaliable': instance.isAvaliable,
    };

PartsResponse _$PartsResponseFromJson(Map<String, dynamic> json) =>
    PartsResponse(
      id: json['Id'] as int?,
      materialId: json['materialId'] as int?,
      name: json['Name'] as String?,
      path: json['Path'] as String?,
      secondaryPath: json['SecondaryPath'] as String?,
      viewsLimit: json['Views_Limit'] as int?,
      canStudentWatch: json['canStudentWatch'] as bool?,
      viewPercentage: json['view_percentage'] as int?,
      videoTypeId: json['videoTypeId'] as int?,
      token: json['Token'] as String?,
      vimeoID: json['VimeoID'] as String?,
      isVimeo: json['isVimeo'] as bool?,
      isComplete: json['isComplete'] as bool?,
      state: json['state'] as bool?,
    );

Map<String, dynamic> _$PartsResponseToJson(PartsResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'materialId': instance.materialId,
      'Name': instance.name,
      'Path': instance.path,
      'SecondaryPath': instance.secondaryPath,
      'Views_Limit': instance.viewsLimit,
      'canStudentWatch': instance.canStudentWatch,
      'view_percentage': instance.viewPercentage,
      'videoTypeId': instance.videoTypeId,
      'Token': instance.token,
      'VimeoID': instance.vimeoID,
      'isVimeo': instance.isVimeo,
      'isComplete': instance.isComplete,
      'state': instance.state,
    };

NextResponse _$NextResponseFromJson(Map<String, dynamic> json) => NextResponse(
      type: json['type'] as String?,
      id: json['id'] as int?,
      order: json['order'] as int?,
    );

Map<String, dynamic> _$NextResponseToJson(NextResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'order': instance.order,
    };
