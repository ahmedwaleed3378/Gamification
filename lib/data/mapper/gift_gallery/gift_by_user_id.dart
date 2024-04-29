import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/gift_gallery/buy_gift_response.dart';
import 'package:gamification/data/responses/gift_gallery/gift_by_user_id_response.dart';
import 'package:gamification/domain/model/gift_gallery/buy_gift_model.dart';
import 'package:gamification/domain/model/gift_gallery/gift_by_user_id_model.dart';

extension GiftByUserIdMapper on GiftByUserIdResponse? {
  GiftByUserIdModel toDomain() {
    return GiftByUserIdModel(
      this?.id.orZero() ?? Constants.zero,
      this?.giftName.orEmpty() ?? Constants.empty,
      this?.giftEnName.orEmpty() ?? Constants.empty,
      this?.giftPoints.orZeroDouble() ?? Constants.zeroD,
      this?.quantity.orZero() ?? Constants.zero,
      this?.giftPicture.orEmpty() ?? Constants.empty,
    );
  }
}



extension AssignGiftMapper on AssignGiftResponse? {
  AssignGiftModel toDomain() {
    return AssignGiftModel(
      this?.returnMessage.orEmpty() ?? Constants.empty,
      this?.returnValue.orZero() ?? Constants.zero,

    );
  }
}
