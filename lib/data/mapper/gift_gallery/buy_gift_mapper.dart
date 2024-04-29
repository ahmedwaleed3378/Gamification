import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/gift_gallery/buy_gift_response.dart';
import 'package:gamification/domain/model/gift_gallery/buy_gift_model.dart';

extension BuyGiftMapper on BuyGiftResponse? {
  BuyGiftModel toDomain() {
    return BuyGiftModel(
      this?.returnValue.orZero() ?? Constants.zero,
    );
  }
}
