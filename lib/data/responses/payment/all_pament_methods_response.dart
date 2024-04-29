import 'package:json_annotation/json_annotation.dart';

part 'all_pament_methods_response.g.dart';

@JsonSerializable()
class AllPaymentMethodsResponse {
  @JsonKey(name: "paymentMethods")
  List<PaymentMethodsResponse>? paymentMethods;

  AllPaymentMethodsResponse({
    this.paymentMethods,
  });

  factory AllPaymentMethodsResponse.fromJson(Map<String, dynamic> json) =>
      _$AllPaymentMethodsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllPaymentMethodsResponseToJson(this);
}

@JsonSerializable()
class PaymentMethodsResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "ar_name")
  String? arName;
  @JsonKey(name: "en_name")
  String? enName;
  @JsonKey(name: "attach_path")
  String? attachPath;
  @JsonKey(name: "isFawry")
  bool? isFawry;
  @JsonKey(name: "isVisa")
  bool? isVisa;
  @JsonKey(name: "isVFCash")
  bool? isVFCash;
  PaymentMethodsResponse({
    this.id,
    this.arName,
    this.enName,
    this.isFawry,
    this.isVisa,
    this.isVFCash
  });

  factory PaymentMethodsResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodsResponseToJson(this);
}
