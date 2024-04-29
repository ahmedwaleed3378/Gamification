import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/register/register_response.dart';
import 'package:gamification/data/responses/register/register_student_response.dart';
import 'package:gamification/domain/model/register/register_model.dart';
import 'package:gamification/domain/model/register/register_student_model.dart';

extension RegisterMapper on RegisterResponse? {
  RegisterModel toDomain() {
    return RegisterModel(
      this?.returnValue.orZero() ?? Constants.zero,
      this?.returnString.orEmpty() ?? Constants.empty,
      this?.userId.orZero() ?? Constants.zero,
      this?.userArName.orEmpty() ?? Constants.empty,
      this?.userPicture.orEmpty() ?? Constants.empty,
      this?.userStage.orEmpty() ?? Constants.empty,
      this?.userEduYaer.orEmpty() ?? Constants.empty,
      this?.userTypeId.orZero() ?? Constants.zero,
      this?.userTypeArName.orEmpty() ?? Constants.empty,
      this?.token.toDomain(),
    );
  }
}

extension TokenMapper on TokenResponse? {
  TokenModel toDomain() {
    return TokenModel(
      this?.funcs.orZero() ?? Constants.zero,
      this?.eduCompList == null
          ? []
          : this!
              .eduCompList!
              .map((eduCompId) => eduCompId)
              .cast<int>()
              .toList(),
      this?.token.orEmpty() ?? Constants.empty,
      this?.returnValue.orZero() ?? Constants.zero,
      this?.roleId.orZero() ?? Constants.zero,
      this?.typeId.orZero() ?? Constants.zero,
    );
  }
}

extension RegisterStudentMapper on RegisterStudentResponse? {
  RegisterStudentModel toDomain() {
    return RegisterStudentModel(
      this?.returnValue.orZero() ?? Constants.zero,
      this?.returnString.orEmpty() ?? Constants.empty,
      this?.studentID.orZero() ?? Constants.zero,
      this?.userID.orZero() ?? Constants.zero,
    );
  }
}

extension AllStagesMapper on AllStagesResponse? {
  AllStagesModel toDomain() {
    return AllStagesModel(this?.stages!.toDomain(),
        this?.stageCountryName.orEmpty() ?? Constants.empty);
  }
}

extension AllEduYearsMapper on AllEduYearsResponse? {
  AllEduYearsModel toDomain() {
    return AllEduYearsModel(
      this?.eduYears == null
          ? []
          : this!
              .eduYears!
              .map((eduYear) => eduYear.toDomain())
              .cast<EduYearModel>()
              .toList(),
    );
  }
}

extension EduYearMapper on EduYearResponse? {
  EduYearModel toDomain() {
    return EduYearModel(
        id: this?.id.orZero() ?? Constants.zero,
        arName: this?.arName ?? Constants.empty,
        enName: this?.enName ?? Constants.empty);
  }
}

extension StageMapper on StageResponse? {
  StageModel toDomain() {
    return StageModel(
      id: this?.id.orZero() ?? Constants.zero,
      stageCounter: this?.stageCounter.orZero() ?? Constants.zero,
      creationUserId: this?.creationUserId.orZero() ?? Constants.zero,
      centerId: this?.centerId.orZero() ?? Constants.zero,
      createdBranchId: this?.createBranchId.orZero() ?? Constants.zero,
      updatedBranchId: this?.updateBranchId.orZero() ?? Constants.zero,
      editedUserId: this?.editedUserId.orZero() ?? Constants.zero,
      countryId: this?.countryId.orZero() ?? Constants.zero,
      state: this?.state ?? false,
      isEnglishStage: this?.isEnhlishStage ?? false,
      arName: this?.stageArName.orEmpty() ?? Constants.empty,
      enName: this?.stageEnName.orEmpty() ?? Constants.empty,
      imagePath: this?.imagePath.orEmpty() ?? Constants.empty,
      creationDate: this?.creationDate.orEmpty() ?? Constants.empty,
      editedDateDate: this?.editedDate.orEmpty() ?? Constants.empty,
    );
  }
}

extension CheckEmailAndPhoneMapper on CheckEmailAndPhoneResponse? {
  CheckEmailAndPhoneModel toDomain() {
    return CheckEmailAndPhoneModel(
        this?.isEmailExist ?? false, this?.isMobileExist ?? false);
  }
}
