// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plans_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlansResponse _$PlansResponseFromJson(Map<String, dynamic> json) =>
    PlansResponse(
      paymentPlans: (json['paymentPlans'] as List<dynamic>?)
          ?.map((e) => PaymentPlansResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlansResponseToJson(PlansResponse instance) =>
    <String, dynamic>{
      'paymentPlans': instance.paymentPlans,
    };

PaymentPlansResponse _$PaymentPlansResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentPlansResponse(
      id: json['id'] as int?,
      planName: json['plan_name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      duration: json['duration'] as int?,
    );

Map<String, dynamic> _$PaymentPlansResponseToJson(
        PaymentPlansResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plan_name': instance.planName,
      'price': instance.price,
      'duration': instance.duration,
    };

ChargeAmountResponse _$ChargeAmountResponseFromJson(
        Map<String, dynamic> json) =>
    ChargeAmountResponse(
      returnValue: json['returnValue'] as int?,
      returnString: json['returnString'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ChargeAmountResponseToJson(
        ChargeAmountResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'returnString': instance.returnString,
      'message': instance.message,
    };
