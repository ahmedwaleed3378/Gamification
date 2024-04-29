import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/mapper/header_profile_data/header_profile_data.dart';
import 'package:gamification/data/responses/gift_gallery/all_gifts_response.dart';
import 'package:gamification/domain/model/gift_gallery/all_gifts_model.dart';

extension AllGiftsMapper on AllGiftsResponse? {
  AllGiftsModel toDomain() {
    return AllGiftsModel(
        this!.profileData.toDomain(),
        this?.allGifts == null
            ? []
            : this!
                .allGifts!
                .map((eduCompId) => eduCompId.toDomain())
                .cast<GiftModel>()
                .toList());
  }
}

extension GiftMapper on GiftResponse? {
  GiftModel toDomain() {
    return GiftModel(
      this?.giftId.orZero() ?? Constants.zero,
      this?.giftArName.orEmpty() ?? Constants.empty,
      this?.giftEnName.orEmpty() ?? Constants.empty,
      this?.giftPicture.orEmpty() ?? Constants.empty,
      this?.giftQuantity.orZero() ?? Constants.zero,
      this?.giftPoints.orZeroDouble() ?? Constants.zeroD,
      this?.giftCategory.orZero() ?? Constants.zero,
      this?.giftDescreption.orEmpty() ?? Constants.empty,
      this?.giftCreationUserId.orZero() ?? Constants.zero,
    );
  }
}
