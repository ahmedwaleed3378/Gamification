import 'package:gamification/app/extension.dart';

import '../../../app/constants.dart';
import '../../../domain/model/check_balance/check_balance.dart';
import '../../responses/check_balance/check_balance_response.dart';

extension CheckBalanceMapper on CheckBalanceResponse? {
  CheckBalanceModel toDomain() {
    return CheckBalanceModel(this?.userBalanceList == null
        ? []
        : this!
            .userBalanceList!
            .map((eduCompId) => eduCompId.toDomain())
            .cast<BalanceModel>()
            .toList());
  }
}

extension BalanceMapper on BalanceResponse? {
  BalanceModel toDomain() {
    return BalanceModel(
      paymentType: this?.paymentType.orEmpty() ?? Constants.empty,
      isExpired: this?.isExpired ?? true,
      isCurrent: this?.isCurrent ?? false,
      ends: this?.ends.orEmpty() ?? Constants.empty,
      begins: this?.begins.orEmpty() ?? Constants.empty,
      amount: this?.amount.orZeroDouble() ?? Constants.zeroD,
      paymentMonth: this?.paymentMonth.orEmpty() ?? Constants.empty,
    );
  }
}
