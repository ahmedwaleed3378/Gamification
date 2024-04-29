// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessRequestResponse _$SuccessRequestResponseFromJson(
        Map<String, dynamic> json) =>
    SuccessRequestResponse(
      returnValue: json['returnValue'] as int?,
      returnString: json['returnString'] as String?,
    );

Map<String, dynamic> _$SuccessRequestResponseToJson(
        SuccessRequestResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'returnString': instance.returnString,
    };
