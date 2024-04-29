import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/payment/plans_response.dart';
import 'package:gamification/domain/model/payment/plans_model.dart';

extension PlansMapper on PlansResponse? {
  PlansModel toDomain() {
    return PlansModel(
      this!
          .paymentPlans!
          .map((payment) => payment.toDomain())
          .cast<PaymentPlansModel>()
          .toList(),
    );
  }
}

extension PaymentPlansMapper on PaymentPlansResponse? {
  PaymentPlansModel toDomain() {
    return PaymentPlansModel(
      this?.id.orZero() ?? Constants.zero,
      this?.planName.orEmpty() ?? Constants.empty,
      this?.price.orZeroDouble() ?? Constants.zeroD,
      this?.duration.orZero() ?? Constants.zero,
    );
  }
}
