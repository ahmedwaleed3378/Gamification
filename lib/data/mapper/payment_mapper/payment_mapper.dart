import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/payment/all_pament_methods_response.dart';
import 'package:gamification/domain/model/payment/all_payment_methods_model.dart';

extension AllPaymentMethodsMapper on AllPaymentMethodsResponse? {
  AllPaymentMethodsModel toDomain() {
    return AllPaymentMethodsModel(
      this!
          .paymentMethods!
          .map((payment) => payment.toDomain())
          .cast<PaymentMethodsModel>()
          .toList(),
    );
  }
}

extension PaymentMethodsMapper on PaymentMethodsResponse? {
  PaymentMethodsModel toDomain() {
    return PaymentMethodsModel(
      this?.id.orZero() ?? Constants.zero,
      this?.arName.orEmpty() ?? Constants.empty,
      this?.enName.orEmpty() ?? Constants.empty,
      this?.attachPath.orEmpty() ?? Constants.empty,
      this?.isFawry ?? false,
      this?.isVisa ?? false,
      this?.isVFCash ?? false,
    );
  }
}
