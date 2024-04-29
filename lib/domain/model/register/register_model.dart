class RegisterModel {
  int returnValue;
  String returnString;
  int userId;
  String userArName;
  String userPicture;
  int userTypeId;
  String userTypeArName;

  String userStage;

  String userEduYaer;
  TokenModel? token;

  RegisterModel(
    this.returnValue,
    this.returnString,
    this.userId,
    this.userArName,
    this.userPicture,
    this.userStage,
    this.userEduYaer,
    this.userTypeId,
    this.userTypeArName,
    this.token,
  );
}

class TokenModel {
  dynamic funcs;
  List<int> eduCompList;
  String token;
  int returnValue;
  int roleId;
  int typeId;

  TokenModel(
    this.funcs,
    this.eduCompList,
    this.token,
    this.returnValue,
    this.roleId,
    this.typeId,
  );
}

// stages and edu years models
class AllStagesModel {
  StageModel? stages;
  String stageCountry;
  AllStagesModel(
    this.stages,
    this.stageCountry,
  );
}

class StageModel {
  int id;
  int stageCounter;
  int creationUserId;
  int centerId;
  int createdBranchId;
  int updatedBranchId;
  int editedUserId;
  int countryId;
  bool state;
  bool isEnglishStage;
  String enName;
  String arName;
  String imagePath;
  String creationDate;
  String editedDateDate;
  StageModel({
    required this.id,
    required this.stageCounter,
    required this.creationUserId,
    required this.centerId,
    required this.createdBranchId,
    required this.updatedBranchId,
    required this.editedUserId,
    required this.countryId,
    required this.state,
    required this.isEnglishStage,
    required this.enName,
    required this.arName,
    required this.imagePath,
    required this.creationDate,
    required this.editedDateDate,
  });
}

class AllEduYearsModel {
  List<EduYearModel?> eduYears;

  AllEduYearsModel(
    this.eduYears,
  );
}

class EduYearModel {
  int id;
  String arName;
  String enName;
  EduYearModel({
    required this.id,
    required this.arName,
    required this.enName,
  });
}

class CheckEmailAndPhoneModel {
  bool isEmailExist;
  bool isMobileExist;
  CheckEmailAndPhoneModel(
    this.isEmailExist,
    this.isMobileExist,
  );
}
