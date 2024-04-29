class ProfileModel {
  UserModel? user;
  String picturePath;
  int userType;
  int eduYearId;
  double totallPoints;
  String eduYear;
  String stage;
  String oldPassword;
  String newPassword;
  String confirmPassword;
  String profilePicture;
  bool isEduYearEditable;

  ProfileModel(
    this.user,
    this.picturePath,
    this.userType,
    this.totallPoints,
    this.eduYear,
    this.stage,
    this.oldPassword,
    this.newPassword,
    this.confirmPassword,
    this.profilePicture,
    this.isEduYearEditable,
    this.eduYearId

  );
}

class UserModel {
  int userID;
  String accountEmail;
  String accountPassword;
  String confirmPassword;
  int roleId;
  int reserveId;
  bool isAdmin;
  int profilePictureId;
  String arName;
  String dateOfBirth;
  int genderId;
  int govId;
  String code;
  String mobile;
  bool state;
  double credits;
  bool isTestAccount;
  int countryId;
  String description;
  bool fullyRegistered;
  bool verified;
  String creationDate;
  int creationUserId;
  int editedUserId;
  String editedDate;
  int centerId;
  int createBranchId;
  int updateBranchId;
  String registrationReferCode;
  int userTypeId;
  int loginCounter;
  UserModel(
    this.userID,
    this.accountEmail,
    this.accountPassword,
    this.confirmPassword,
    this.roleId,
    this.reserveId,
    this.isAdmin,
    this.profilePictureId,
    this.arName,
    this.dateOfBirth,
    this.genderId,
    this.govId,
    this.code,
    this.mobile,
    this.state,
    this.credits,
    this.isTestAccount,
    this.countryId,
    this.description,
    this.fullyRegistered,
    this.verified,
    this.creationDate,
    this.creationUserId,
    this.editedUserId,
    this.editedDate,
    this.centerId,
    this.createBranchId,
    this.updateBranchId,
    this.registrationReferCode,
    this.userTypeId,
    this.loginCounter
  );
}
