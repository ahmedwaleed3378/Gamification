import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/profile/profile_response.dart';
import 'package:gamification/domain/model/editProfile/edit_profile.dart';

extension EditProfileResponseMapper on EditProfileResponse {
  EditProfileModel toDomain() {
    return EditProfileModel(
      this?.returnValue.orZero() ?? Constants.zero,
      this?.returnMsg.orEmpty() ?? Constants.empty,
    );
  }
}
