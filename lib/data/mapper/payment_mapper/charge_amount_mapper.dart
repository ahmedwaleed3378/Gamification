import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/payment/plans_response.dart';
import 'package:gamification/domain/model/payment/charge_amount_model.dart';


extension ChargeAmountMapper on ChargeAmountResponse? {
  ChargeAmountModel toDomain() {
    return ChargeAmountModel(
      this?.returnValue.orZero() ?? Constants.zero,
      this?.returnString.orEmpty() ?? Constants.empty,
      this?.message.orEmpty() ?? Constants.empty,
    );
  }
}
