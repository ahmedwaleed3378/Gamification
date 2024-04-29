// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      picturePath: json['picturePath'] as String?,
      userType: json['userType'] as int?,
      oldPassword: json['oldPassword'] as String?,
      newPassword: json['newPassword'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      profilePicture: json['profilePicture'] as String?,
      teacherSubjects: json['teacher_subjects'] as String?,
      studentMv: json['student_mv'] as String?,
      examSubjects: json['examSubjects'] as String?,
      student: json['student'] as String?,
      teacher: json['teacher'] as String?,
      studentStage: json['student_stage'] as String?,
      studentEduYear: json['student_eduYear'] as String?,
      totallPoints: (json['TotallPoints'] as num?)?.toDouble(),
      isEduYearEditable: json['isEduYearEditable'] as bool?,
      eduYearId: json['student_eduYearId'] as int?,
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'picturePath': instance.picturePath,
      'userType': instance.userType,
      'student_eduYearId': instance.eduYearId,
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
      'confirmPassword': instance.confirmPassword,
      'profilePicture': instance.profilePicture,
      'teacher_subjects': instance.teacherSubjects,
      'student_mv': instance.studentMv,
      'examSubjects': instance.examSubjects,
      'student': instance.student,
      'teacher': instance.teacher,
      'student_stage': instance.studentStage,
      'student_eduYear': instance.studentEduYear,
      'TotallPoints': instance.totallPoints,
      'isEduYearEditable': instance.isEduYearEditable,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      userID: json['user_ID'] as int?,
      accountEmail: json['account_email'] as String?,
      accountPassword: json['account_password'] as String?,
      confirmPassword: json['ConfirmPassword'] as String?,
      roleId: json['roleId'] as int?,
      reserveId: json['reserveId'] as int?,
      isAdmin: json['IsAdmin'] as bool?,
      profilePictureId: json['profilePictureId'] as int?,
      arName: json['ar_name'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      genderId: json['gender_id'] as int?,
      govId: json['gov_id'] as int?,
      code: json['code'] as String?,
      mobile: json['mobile'] as String?,
      state: json['state'] as bool?,
      credits: (json['credits'] as num?)?.toDouble(),
      isTestAccount: json['IsTestAccount'] as bool?,
      countryId: json['country_id'] as int?,
      description: json['description'] as String?,
      fullyRegistered: json['fullyRegistered'] as bool?,
      verified: json['verified'] as bool?,
      creationDate: json['creationDate'] as String?,
      creationUserId: json['CreationUserId'] as int?,
      editedUserId: json['EditedUserId'] as int?,
      editedDate: json['EditedDate'] as String?,
      centerId: json['centerId'] as int?,
      createBranchId: json['CreateBranchId'] as int?,
      updateBranchId: json['UpdateBranchId'] as int?,
      registrationReferCode: json['RegistrationReferCode'] as String?,
      userTypeId: json['userTypeId'] as int?,
      loginCounter: json['loginCounter'] as int?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'user_ID': instance.userID,
      'account_email': instance.accountEmail,
      'account_password': instance.accountPassword,
      'ConfirmPassword': instance.confirmPassword,
      'roleId': instance.roleId,
      'reserveId': instance.reserveId,
      'IsAdmin': instance.isAdmin,
      'profilePictureId': instance.profilePictureId,
      'ar_name': instance.arName,
      'date_of_birth': instance.dateOfBirth,
      'gender_id': instance.genderId,
      'gov_id': instance.govId,
      'code': instance.code,
      'mobile': instance.mobile,
      'state': instance.state,
      'credits': instance.credits,
      'IsTestAccount': instance.isTestAccount,
      'country_id': instance.countryId,
      'description': instance.description,
      'fullyRegistered': instance.fullyRegistered,
      'verified': instance.verified,
      'creationDate': instance.creationDate,
      'CreationUserId': instance.creationUserId,
      'EditedUserId': instance.editedUserId,
      'EditedDate': instance.editedDate,
      'centerId': instance.centerId,
      'CreateBranchId': instance.createBranchId,
      'UpdateBranchId': instance.updateBranchId,
      'RegistrationReferCode': instance.registrationReferCode,
      'userTypeId': instance.userTypeId,
      'loginCounter': instance.loginCounter,
    };

EditProfileResponse _$EditProfileResponseFromJson(Map<String, dynamic> json) =>
    EditProfileResponse(
      json['returnValue'] as int?,
      json['returnMsg'] as String?,
    );

Map<String, dynamic> _$EditProfileResponseToJson(
        EditProfileResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'returnMsg': instance.returnMsg,
    };
