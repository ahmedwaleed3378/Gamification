import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/gift_gallery/all_gifts_response.dart';

import '../../../app/constants.dart';
import '../../../domain/model/header_profile_data/header_profile_data.dart';

extension HeaderProfileDataMapper on ProfileDataResponse? {
  ProfileDataModel toDomain() {
    return ProfileDataModel(
        this?.userProfilePhoto.orEmpty() ?? Constants.empty,
        this?.loginCounter.orZero() ?? Constants.zero,
        this?.teacherName.orZeroDouble() ?? Constants.zeroD,
        this?.availablePoints.orZeroDouble() ?? Constants.zeroD);
  }
}
