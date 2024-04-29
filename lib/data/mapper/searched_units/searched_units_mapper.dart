import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/searched_units/searched_unit_response.dart';
import 'package:gamification/domain/model/searched_unit/searched_unit_model.dart';

extension SearchedUnitMapper on SearchedUnitResponse? {
  SearchedUnitModel toDomain() {
    return SearchedUnitModel(
      this?.id.orZero() ?? Constants.zero,
      this?.subjectId.orZero() ?? Constants.zero,
      this?.unitArName.orEmpty() ?? Constants.empty,
      this?.unitEnName.orEmpty() ?? Constants.empty,
      this?.state ?? false,
      this?.sesemesterID.orZero() ?? Constants.zero,
      this?.unitThumbnailId.orZero() ?? Constants.zero,
      this?.unitDescription.orEmpty() ?? Constants.empty,
      this?.creationUserId.orZero() ?? Constants.zero,
      this?.creationDate.orEmpty() ?? Constants.empty,
      this?.editedUserId.orZero() ?? Constants.zero,
      this?.editedDate.orEmpty() ?? Constants.empty,
      this?.centerId.orZero() ?? Constants.zero,
      this?.createBranchId.orZero() ?? Constants.zero,
      this?.updateBranchId.orZero() ?? Constants.zero,
      this?.orderNum.orZero() ?? Constants.zero,
      this?.isMandatory ?? false,
      // this?.unitThumb.orEmpty() ?? Constants.empty,
      this?.thumbnailPic.orEmpty() ?? Constants.empty,
      this?.totalPrice.orZeroDouble() ?? Constants.zeroD,
      this?.discountPrice.orZeroDouble() ?? Constants.zeroD,
      this?.firstMaterialId.orZero() ?? Constants.zero,
      this?.matCount.orZeroDouble() ?? Constants.zeroD,
      this?.examCount.orZeroDouble() ?? Constants.zeroD,
      this?.docAttachCount.orZero() ?? Constants.zero,
      this?.offlineMatCount.orZero() ?? Constants.zero,
      this?.attachPath.orEmpty() ?? Constants.empty,
    );
  }
}
