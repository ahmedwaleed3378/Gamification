// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_pament_methods_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllPaymentMethodsResponse _$AllPaymentMethodsResponseFromJson(
        Map<String, dynamic> json) =>
    AllPaymentMethodsResponse(
      paymentMethods: (json['paymentMethods'] as List<dynamic>?)
          ?.map(
              (e) => PaymentMethodsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllPaymentMethodsResponseToJson(
        AllPaymentMethodsResponse instance) =>
    <String, dynamic>{
      'paymentMethods': instance.paymentMethods,
    };

PaymentMethodsResponse _$PaymentMethodsResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodsResponse(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
      isFawry: json['isFawry'] as bool?,
      isVisa: json['isVisa'] as bool?,
      isVFCash: json['isVFCash'] as bool?,
    )..attachPath = json['attach_path'] as String?;

Map<String, dynamic> _$PaymentMethodsResponseToJson(
        PaymentMethodsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ar_name': instance.arName,
      'en_name': instance.enName,
      'attach_path': instance.attachPath,
      'isFawry': instance.isFawry,
      'isVisa': instance.isVisa,
      'isVFCash': instance.isVFCash,
    };
