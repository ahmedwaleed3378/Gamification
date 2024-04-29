// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckBalanceResponse _$CheckBalanceResponseFromJson(
        Map<String, dynamic> json) =>
    CheckBalanceResponse(
      userBalanceList: (json['userBalanceList'] as List<dynamic>?)
          ?.map((e) => BalanceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckBalanceResponseToJson(
        CheckBalanceResponse instance) =>
    <String, dynamic>{
      'userBalanceList': instance.userBalanceList,
    };

BalanceResponse _$BalanceResponseFromJson(Map<String, dynamic> json) =>
    BalanceResponse(
      paymentType: json['PaymentType'] as String?,
      isExpired: json['IsExpired'] as bool?,
      isCurrent: json['IsCurrent'] as bool?,
      ends: json['Ends'] as String?,
      begins: json['Begins'] as String?,
      paymentMonth: json['PaymentMonth'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BalanceResponseToJson(BalanceResponse instance) =>
    <String, dynamic>{
      'PaymentType': instance.paymentType,
      'IsExpired': instance.isExpired,
      'IsCurrent': instance.isCurrent,
      'Ends': instance.ends,
      'Begins': instance.begins,
      'PaymentMonth': instance.paymentMonth,
      'amount': instance.amount,
    };
