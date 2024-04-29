import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/gift_gallery/gift_gallery_response.dart';
import 'package:gamification/domain/model/gift_gallery/gift_gallery_model.dart';

extension GiftGalleryContentMapper on GiftGalleryContentResponse? {
  GiftGalleryContentModel toDomain() {
    return GiftGalleryContentModel(
      this?.id.orZero() ?? Constants.zero,
      this?.arabicName.orEmpty() ?? Constants.empty,
      this?.englishName.orEmpty() ?? Constants.empty,
      this?.qty.orZero() ?? Constants.zero,
      this?.points.orZeroDouble() ?? Constants.zeroD,
      this?.description.orEmpty() ?? Constants.empty,
      this?.attachPath.orEmpty() ?? Constants.empty,
    );
  }
}

extension GiftGalleryMapper on GiftGalleryResponse? {
  GiftGalleryModel toDomain() {
    return GiftGalleryModel(
        this?.giftGallery?.map((giftGallery) => giftGallery.toDomain())
            .cast<GiftGalleryContentModel>().toList(),
        this?.itemsCount.orZero() ?? Constants.zero);
  }
}
