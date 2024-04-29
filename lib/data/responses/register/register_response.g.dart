// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      returnValue: json['returnValue'] as int?,
      returnString: json['returnString'] as String?,
      userId: json['user_id'] as int?,
      userArName: json['user_ar_name'] as String?,
      userPicture: json['user_picture'] as String?,
      userTypeId: json['user_type_id'] as int?,
      userStage: json['user_stageName'] as String?,
      userEduYaer: json['user_eduYearName'] as String?,
      userTypeArName: json['user_type_ar_name'] as String?,
      token: json['token'] == null
          ? null
          : TokenResponse.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'returnString': instance.returnString,
      'user_id': instance.userId,
      'user_ar_name': instance.userArName,
      'user_picture': instance.userPicture,
      'user_type_id': instance.userTypeId,
      'user_type_ar_name': instance.userTypeArName,
      'user_stageName': instance.userStage,
      'user_eduYearName': instance.userEduYaer,
      'token': instance.token,
    };

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) =>
    TokenResponse(
      funcs: json['funcs'] as int?,
      eduCompList: (json['EduCompList'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      token: json['token'] as String?,
      returnValue: json['returnValue'] as int?,
      roleId: json['role_Id'] as int?,
      typeId: json['type_Id'] as int?,
    );

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'funcs': instance.funcs,
      'EduCompList': instance.eduCompList,
      'token': instance.token,
      'returnValue': instance.returnValue,
      'role_Id': instance.roleId,
      'type_Id': instance.typeId,
    };

AllStagesResponse _$AllStagesResponseFromJson(Map<String, dynamic> json) =>
    AllStagesResponse(
      stages: json['stage'] == null
          ? null
          : StageResponse.fromJson(json['stage'] as Map<String, dynamic>),
      stageCountryName: json['stageCountryName'] as String?,
    );

Map<String, dynamic> _$AllStagesResponseToJson(AllStagesResponse instance) =>
    <String, dynamic>{
      'stage': instance.stages,
      'stageCountryName': instance.stageCountryName,
    };

StageResponse _$StageResponseFromJson(Map<String, dynamic> json) =>
    StageResponse(
      stageArName: json['stage_ar_name'] as String?,
      stageEnName: json['stage_en_name'] as String?,
      state: json['state'] as bool?,
      imagePath: json['ImagePath'] as String?,
      stageCounter: json['StageCountr'] as int?,
      isEnhlishStage: json['EnglishStage'] as bool?,
      countryId: json['CountryID'] as int?,
      creationDate: json['CreationDate'] as String?,
      creationUserId: json['CreationUserId'] as int?,
      editedUserId: json['EditedUserId'] as int?,
      editedDate: json['EditedDate'] as String?,
      centerId: json['centerId'] as int?,
      createBranchId: json['CreateBranchId'] as int?,
      updateBranchId: json['UpdateBranchId'] as int?,
    )..id = json['id'] as int?;

Map<String, dynamic> _$StageResponseToJson(StageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stage_ar_name': instance.stageArName,
      'stage_en_name': instance.stageEnName,
      'state': instance.state,
      'ImagePath': instance.imagePath,
      'StageCountr': instance.stageCounter,
      'EnglishStage': instance.isEnhlishStage,
      'CountryID': instance.countryId,
      'CreationDate': instance.creationDate,
      'CreationUserId': instance.creationUserId,
      'EditedUserId': instance.editedUserId,
      'EditedDate': instance.editedDate,
      'centerId': instance.centerId,
      'CreateBranchId': instance.createBranchId,
      'UpdateBranchId': instance.updateBranchId,
    };

AllEduYearsResponse _$AllEduYearsResponseFromJson(Map<String, dynamic> json) =>
    AllEduYearsResponse(
      eduYears: (json['eduYearsList'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : EduYearResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllEduYearsResponseToJson(
        AllEduYearsResponse instance) =>
    <String, dynamic>{
      'eduYearsList': instance.eduYears,
    };

EduYearResponse _$EduYearResponseFromJson(Map<String, dynamic> json) =>
    EduYearResponse(
      id: json['id'] as int?,
      enName: json['Educational_year_en_name'] as String?,
      arName: json['Educational_year_ar_name'] as String?,
    );

Map<String, dynamic> _$EduYearResponseToJson(EduYearResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Educational_year_en_name': instance.enName,
      'Educational_year_ar_name': instance.arName,
    };

CheckEmailAndPhoneResponse _$CheckEmailAndPhoneResponseFromJson(
        Map<String, dynamic> json) =>
    CheckEmailAndPhoneResponse(
      isEmailExist: json['isEmailExist'] as bool?,
      isMobileExist: json['isMobileExist'] as bool?,
    );

Map<String, dynamic> _$CheckEmailAndPhoneResponseToJson(
        CheckEmailAndPhoneResponse instance) =>
    <String, dynamic>{
      'isEmailExist': instance.isEmailExist,
      'isMobileExist': instance.isMobileExist,
    };
