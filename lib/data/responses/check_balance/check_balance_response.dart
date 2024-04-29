import 'package:json_annotation/json_annotation.dart';

part 'check_balance_response.g.dart';

@JsonSerializable()
class CheckBalanceResponse {
  @JsonKey(name: "userBalanceList")
  List<BalanceResponse>? userBalanceList;

  CheckBalanceResponse({
    this.userBalanceList,
  });
  factory CheckBalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckBalanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckBalanceResponseToJson(this);

}

@JsonSerializable()
class BalanceResponse {
  @JsonKey(name: "PaymentType")
  String? paymentType;
  @JsonKey(name: "IsExpired")
  bool? isExpired;
  @JsonKey(name: "IsCurrent")
  bool? isCurrent;
  @JsonKey(name: "Ends")
  String? ends;
  @JsonKey(name: "Begins")
  String? begins;
  @JsonKey(name: "PaymentMonth")
  String? paymentMonth;
  @JsonKey(name: "amount")
  double? amount;
  BalanceResponse({
    this.paymentType,
    this.isExpired,
    this.isCurrent,
    this.ends,
    this.begins,
    this.paymentMonth,
    this.amount,
  });  
  factory BalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$BalanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceResponseToJson(this);
}
