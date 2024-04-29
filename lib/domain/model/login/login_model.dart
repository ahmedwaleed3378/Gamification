class LoginModel {
  int returnValue;
  String returnString;
  int yearId;
  int studentId;
  int userId;
  double totallPoints;
  String userArName;
  String userPicture;
  int userTypeId;
  int loginCounter;
  String userTypeArName;
  AuthTokenModel? authToken;
  String userStage;

  String userEduYear;

  LoginModel(
      this.returnValue,
      this.returnString,
      this.yearId,
      this.studentId,
      this.userId,
      this.userArName,
      this.userPicture,
      this.userStage,
      this.userEduYear,
      this.userTypeId,
      this.userTypeArName,
      this.authToken,
      this.totallPoints,
      this.loginCounter);
}

class AuthTokenModel {
  List<int> eduCompList;
  String token;
  int returnValue;
  int roleId;
  int typeId;

  AuthTokenModel(
    this.eduCompList,
    this.token,
    this.returnValue,
    this.roleId,
    this.typeId,
  );
}
