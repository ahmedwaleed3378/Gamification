import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/profile/profile_response.dart';
import 'package:gamification/domain/model/profile/profile_model.dart';

extension UserResponseMapper on UserResponse? {
  UserModel toDomain() {
    return UserModel(
        this?.userID.orZero() ?? Constants.zero,
        this?.accountEmail.orEmpty() ?? Constants.empty,
        this?.accountPassword.orEmpty() ?? Constants.empty,
        this?.confirmPassword.orEmpty() ?? Constants.empty,
        this?.roleId.orZero() ?? Constants.zero,
        this?.reserveId.orZero() ?? Constants.zero,
        this?.isAdmin ?? false,
        this?.profilePictureId.orZero() ?? Constants.zero,
        this?.arName.orEmpty() ?? Constants.empty,
        this?.dateOfBirth.orEmpty() ?? Constants.empty,
        this?.genderId.orZero() ?? Constants.zero,
        this?.govId.orZero() ?? Constants.zero,
        this?.code.orEmpty() ?? Constants.empty,
        this?.mobile.orEmpty() ?? Constants.empty,
        this?.state ?? false,
        this?.credits ?? Constants.zeroD,
        this?.isTestAccount ?? false,
        this?.countryId.orZero() ?? Constants.zero,
        this?.description.orEmpty() ?? Constants.empty,
        this?.fullyRegistered ?? false,
        this?.verified ?? false,
        this?.creationDate.orEmpty() ?? Constants.empty,
        this?.creationUserId.orZero() ?? Constants.zero,
        this?.editedUserId.orZero() ?? Constants.zero,
        this?.editedDate.orEmpty() ?? Constants.empty,
        this?.centerId.orZero() ?? Constants.zero,
        this?.createBranchId.orZero() ?? Constants.zero,
        this?.updateBranchId.orZero() ?? Constants.zero,
        this?.registrationReferCode.orEmpty() ?? Constants.empty,
        this?.userTypeId.orZero() ?? Constants.zero,
        this?.loginCounter.orZero() ?? Constants.zero);
  }
}

extension ProfileResponseMapper on ProfileResponse? {
  ProfileModel toDomain() {
    return ProfileModel(
      this?.user.toDomain(),
      this?.picturePath.orEmpty() ?? Constants.empty,
      this?.userType.orZero() ?? Constants.zero,
      this?.totallPoints.orZeroDouble() ?? Constants.zeroD,
      this?.studentEduYear.orEmpty() ?? Constants.empty,
      this?.studentStage.orEmpty() ?? Constants.empty,
      this?.oldPassword.orEmpty() ?? Constants.empty,
      this?.newPassword.orEmpty() ?? Constants.empty,
      this?.confirmPassword.orEmpty() ?? Constants.empty,
      this?.profilePicture.orEmpty() ?? Constants.empty,
      this?.isEduYearEditable ?? false,
      this?.eduYearId.orZero() ?? Constants.zero,
    );
  }
}
