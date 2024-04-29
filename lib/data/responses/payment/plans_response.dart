import 'package:json_annotation/json_annotation.dart';

part 'plans_response.g.dart';

@JsonSerializable()
class PlansResponse {
  @JsonKey(name: "paymentPlans")
  List<PaymentPlansResponse>? paymentPlans;

  PlansResponse({
    this.paymentPlans,
  });

  factory PlansResponse.fromJson(Map<String, dynamic> json) =>
      _$PlansResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlansResponseToJson(this);
}

@JsonSerializable()
class PaymentPlansResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "plan_name")
  String? planName;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "duration")
  int? duration;

  PaymentPlansResponse({
    this.id,
    this.planName,
    this.price,
    this.duration
  });

  factory PaymentPlansResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentPlansResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentPlansResponseToJson(this);
}


@JsonSerializable()
class ChargeAmountResponse {
  @JsonKey(name: "returnValue")
  int? returnValue;
  @JsonKey(name: "returnString")
  String? returnString;
  @JsonKey(name: "message")
  String? message;

  ChargeAmountResponse({
    this.returnValue,
    this.returnString,
    this.message,
  });

  factory ChargeAmountResponse.fromJson(Map<String, dynamic> json) =>
      _$ChargeAmountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChargeAmountResponseToJson(this);
}
