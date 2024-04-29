import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String email, String password) = _LoginObject;
}

@freezed
class RegisterObject with _$RegisterObject {
  factory RegisterObject(
    String email,
    String password,
    String passwordConfirm,
    String arname,
    String mobileNumber,
    // String parentMobileNumber,
    // String parentName,
    int userTypeId,
    int stageId,
    int eduYearId,
  ) = _RegisterObject;
}

@freezed
class ProfileObject with _$ProfileObject {
  factory ProfileObject(
    String userName,
    String email,
    String mobile,
    String password,
    String newPassword,
    String confirmNewPassword,
    String profilePicture,
    double totalPoints,
    int loginCounter,
    String stage,
    String academicYear,
    bool isEduYearEditable,
    int eduYearId,
  ) = _ProfileObject;
}

@freezed
class PictureObject with _$PictureObject {
  factory PictureObject(String base64, String name, int size, String type,
      int lastModified, String lastModifiedDate) = _PictureObject;
}
