// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_gift_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyGiftResponse _$BuyGiftResponseFromJson(Map<String, dynamic> json) =>
    BuyGiftResponse(
      returnValue: json['returnValue'] as int?,
    );

Map<String, dynamic> _$BuyGiftResponseToJson(BuyGiftResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
    };

AssignGiftResponse _$AssignGiftResponseFromJson(Map<String, dynamic> json) =>
    AssignGiftResponse(
      returnMessage: json['returnMessege'] as String?,
      returnValue: json['returnValue'] as int?,
    );

Map<String, dynamic> _$AssignGiftResponseToJson(AssignGiftResponse instance) =>
    <String, dynamic>{
      'returnMessege': instance.returnMessage,
      'returnValue': instance.returnValue,
    };
