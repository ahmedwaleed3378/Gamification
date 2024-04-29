import 'package:json_annotation/json_annotation.dart';

part 'requests.g.dart';

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: "account_email")
  String? accountEmail;
  @JsonKey(name: "account_password")
  String? accountPassword;

  LoginRequest({
    this.accountEmail,
    this.accountPassword,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: "Id")
  int? id;
  @JsonKey(name: "userTypeId")
  int? userTypeId;
  @JsonKey(name: "ar_name")
  String? arName;
  @JsonKey(name: "mobile")
  String? mobile;
  @JsonKey(name: "account_email")
  String? accountEmail;
  @JsonKey(name: "account_password")
  String? accountPassword;
  @JsonKey(name: "confirmPassword")
  String? confirmPassword;
  @JsonKey(name: "stageID")
  int? stageID;
  @JsonKey(name: "EduYearID")
  int? eduYearID;
  // @JsonKey(name: "parentName")
  // String? parentName;
  // @JsonKey(name: "parentPhoneNumber")
  // String? parentPhoneNumber;


  RegisterRequest(
      {this.userTypeId,
      this.arName,
      this.mobile,
      this.accountEmail,
      this.accountPassword,
      this.confirmPassword,
      this.stageID,
      this.eduYearID,
      // this.parentName,
      // this.parentPhoneNumber,
   });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

class LectureRowRequest {
  int materialId;
  int partId;

  LectureRowRequest(
    this.materialId,
    this.partId,
  );
}

@JsonSerializable()
class EditProfileRequest {
  @JsonKey(name: "ar_name")
  String? arName;
  @JsonKey(name: "mobile")
  String? mobile;
  @JsonKey(name: "account_email")
  String? accountEmail;
  @JsonKey(name: "account_password")
  String? accountPassword;

  @JsonKey(name: "newPassword")
  String? newPassword;

  @JsonKey(name: "ConfirmPassword")
  String? confirmPassword;

  @JsonKey(name: "profilePicture")
  UserPictureProfile? userPictureProfile;
  @JsonKey(name: "eduYearId")
  int? eduYearId;

  EditProfileRequest({
    this.arName,
    this.mobile,
    this.accountEmail,
    this.accountPassword,
    this.newPassword,
    this.confirmPassword,
    this.userPictureProfile,
    this.eduYearId
  });

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileRequestToJson(this);
}

@JsonSerializable()
class UserPictureProfile {
  @JsonKey(name: "FileAsBase64")
  String? fileAsBase64;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "size")
  int? size;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "LastModified")
  int? lastModified;
  @JsonKey(name: "LastModifiedDate")
  String? lastModifiedDate;

  UserPictureProfile({
    this.fileAsBase64,
    this.name,
    this.size,
    this.type,
    this.lastModified,
    this.lastModifiedDate,
  });

  factory UserPictureProfile.fromJson(Map<String, dynamic> json) =>
      _$UserPictureProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserPictureProfileToJson(this);
}

@JsonSerializable()
class SubmitSingleQuestionHistoryRequest {
  @JsonKey(name: "examId")
  int? examId;
  @JsonKey(name: "studentUserId")
  int? studentUserId;
  @JsonKey(name: "questionId")
  int? questionId;
  @JsonKey(name: "question_sentence_id")
  int? questionSentenceId;
  @JsonKey(name: "question_answer_id")
  int? questionAnswerId;

  SubmitSingleQuestionHistoryRequest({
    this.examId,
    this.studentUserId,
    this.questionId,
    this.questionSentenceId,
    this.questionAnswerId,
  });

  factory SubmitSingleQuestionHistoryRequest.fromJson(
          Map<String, dynamic> json) =>
      _$SubmitSingleQuestionHistoryRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SubmitSingleQuestionHistoryRequestToJson(this);
}

@JsonSerializable()
class SubmitSingleQuestionRequest {
  @JsonKey(name: "examId")
  int? examId;
  @JsonKey(name: "studentUserId")
  int? studentUserId;
  @JsonKey(name: "questionId")
  int? questionId;
  @JsonKey(name: "question_sentence_id")
  int? questionSentenceId;
  @JsonKey(name: "question_answer_id")
  int? questionAnswerId;

  SubmitSingleQuestionRequest({
    this.examId,
    this.studentUserId,
    this.questionId,
    this.questionSentenceId,
    this.questionAnswerId,
  });

  factory SubmitSingleQuestionRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitSingleQuestionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitSingleQuestionRequestToJson(this);
}

@JsonSerializable()
class SubmitMCQSingleQuestionRequest {
  @JsonKey(name: "examId")
  int? examId;
  @JsonKey(name: "studentUserId")
  int? studentUserId;
  @JsonKey(name: "questionId")
  int? questionId;
  @JsonKey(name: "PickedChoiceId")
  int? pickedChoiceId;

  SubmitMCQSingleQuestionRequest({
    this.examId,
    this.studentUserId,
    this.questionId,
    this.pickedChoiceId,
  });

  factory SubmitMCQSingleQuestionRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitMCQSingleQuestionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitMCQSingleQuestionRequestToJson(this);
}

@JsonSerializable()
class ContainerSubmitSingleQuestionRequest {
  @JsonKey(name: "examId")
  int? examId;
  @JsonKey(name: "studentUserId")
  int? studentUserId;
  @JsonKey(name: "questionId")
  int? questionId;
  @JsonKey(name: "questionDetails")
  List<ContainerQuestionDetails>? questionDetails;

  ContainerSubmitSingleQuestionRequest({
    this.examId,
    this.studentUserId,
    this.questionId,
    this.questionDetails,
  });

  factory ContainerSubmitSingleQuestionRequest.fromJson(
          Map<String, dynamic> json) =>
      _$ContainerSubmitSingleQuestionRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ContainerSubmitSingleQuestionRequestToJson(this);
}

@JsonSerializable()
class CompleteSubmitSingleQuestionRequest {
  @JsonKey(name: "examId")
  int? examId;
  @JsonKey(name: "studentUserId")
  int? studentUserId;
  @JsonKey(name: "questionId")
  int? questionId;
  @JsonKey(name: "questionDetails")
  List<CompleteQuestionDetails>? questionDetails;

  CompleteSubmitSingleQuestionRequest({
    this.examId,
    this.studentUserId,
    this.questionId,
    this.questionDetails,
  });

  factory CompleteSubmitSingleQuestionRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CompleteSubmitSingleQuestionRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CompleteSubmitSingleQuestionRequestToJson(this);
}

@JsonSerializable()
class ContainerQuestionDetails {
  @JsonKey(name: "question_sentence_id")
  int? questionSentenceId;
  @JsonKey(name: "question_answer_ids")
  List<int>? questionAnswerIds;

  ContainerQuestionDetails({
    this.questionSentenceId,
    this.questionAnswerIds,
  });

  factory ContainerQuestionDetails.fromJson(Map<String, dynamic> json) =>
      _$ContainerQuestionDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerQuestionDetailsToJson(this);
}

@JsonSerializable()
class CompleteQuestionDetails {
  @JsonKey(name: "question_sentence_id")
  int? questionSentenceId;
  @JsonKey(name: "question_answer_id")
  int? questionAnswerIds;

  CompleteQuestionDetails({
    this.questionSentenceId,
    this.questionAnswerIds,
  });

  factory CompleteQuestionDetails.fromJson(Map<String, dynamic> json) =>
      _$CompleteQuestionDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteQuestionDetailsToJson(this);
}

@JsonSerializable()
class SubmitExamRequest {
  @JsonKey(name: 'examId')
  int? examId;
  @JsonKey(name: 'studentUserId')
  int? studentUserId;
  @JsonKey(name: 'solvedExamStudent_ID')
  int? solvedExamStudentID;
  @JsonKey(name: 'ExamStarTime')
  String? examStarTime;

  SubmitExamRequest({
    this.examId,
    this.studentUserId,
    this.solvedExamStudentID,
    this.examStarTime,
  });

  factory SubmitExamRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitExamRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitExamRequestToJson(this);
}

@JsonSerializable()
class AddTeachingRequest {
  @JsonKey(name: 'details')
  String? details;
  @JsonKey(name: 'numberOfDays')
  int? numberOfDays;
  @JsonKey(name: 'courseId')
  int? courseId;

  AddTeachingRequest({
    this.details,
    this.numberOfDays,
    this.courseId,
  });

  factory AddTeachingRequest.fromJson(Map<String, dynamic> json) =>
      _$AddTeachingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddTeachingRequestToJson(this);
}

@JsonSerializable()
class AddCourseRequest {
  @JsonKey(name: 'reasonOfRequest')
  String? reasonOfRequest;
  @JsonKey(name: 'numberOfDays')
  int? numberOfDays;
  @JsonKey(name: 'courseId')
  int? courseId;

  AddCourseRequest({
    this.reasonOfRequest,
    this.numberOfDays,
    this.courseId,
  });

  factory AddCourseRequest.fromJson(Map<String, dynamic> json) =>
      _$AddCourseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddCourseRequestToJson(this);
}

@JsonSerializable()
class AssignGiftToUserRequest {
  @JsonKey(name: 'giftId')
  int? giftId;
  @JsonKey(name: 'quantity')
  int? quantity;

  AssignGiftToUserRequest({
    this.giftId,
    this.quantity,
  });

  factory AssignGiftToUserRequest.fromJson(Map<String, dynamic> json) =>
      _$AssignGiftToUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AssignGiftToUserRequestToJson(this);
}

@JsonSerializable()
class SubmitMatchingQuestionRequest {
  @JsonKey(name: 'examId')
  int? examId;
  @JsonKey(name: 'studentUserId')
  int? studentUserId;
  @JsonKey(name: 'questionId')
  int? questionId;
  @JsonKey(name: 'matching_answers')
  List<MatchingAnswers>? matchingAnswers;

  SubmitMatchingQuestionRequest({
    this.examId,
    this.studentUserId,
    this.questionId,
    this.matchingAnswers,
  });

  factory SubmitMatchingQuestionRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitMatchingQuestionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitMatchingQuestionRequestToJson(this);
}

@JsonSerializable()
class MatchingAnswers {
  @JsonKey(name: 'leftSideId')
  int? leftSideId;
  @JsonKey(name: 'rightSideId')
  int? rightSideId;

  MatchingAnswers({this.leftSideId, this.rightSideId});

  factory MatchingAnswers.fromJson(Map<String, dynamic> json) =>
      _$MatchingAnswersFromJson(json);

  Map<String, dynamic> toJson() => _$MatchingAnswersToJson(this);
}

@JsonSerializable()
class SubmitMatchingQuestionRequestHistory {
  @JsonKey(name: 'examId')
  int? examId;
  @JsonKey(name: 'studentUserId')
  int? studentUserId;
  @JsonKey(name: 'questionId')
  int? questionId;
  @JsonKey(name: 'left_side_id')
  int? leftSideId;
  @JsonKey(name: 'right_side_id')
  int? rightSideId;

  SubmitMatchingQuestionRequestHistory({
    this.examId,
    this.studentUserId,
    this.questionId,
    this.leftSideId,
    this.rightSideId,
  });

  factory SubmitMatchingQuestionRequestHistory.fromJson(
          Map<String, dynamic> json) =>
      _$SubmitMatchingQuestionRequestHistoryFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SubmitMatchingQuestionRequestHistoryToJson(this);
}

@JsonSerializable()
class SubmitSingleVoiceQuestionRequest {
  @JsonKey(name: 'examId')
  int? examId;
  @JsonKey(name: 'studentUserId')
  int? studentUserId;
  @JsonKey(name: 'questionId')
  int? questionId;
  @JsonKey(name: 'answerText')
  String? answerText;

  SubmitSingleVoiceQuestionRequest(
      {this.examId, this.studentUserId, this.questionId, this.answerText});

  factory SubmitSingleVoiceQuestionRequest.fromJson(
          Map<String, dynamic> json) =>
      _$SubmitSingleVoiceQuestionRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SubmitSingleVoiceQuestionRequestToJson(this);
}

@JsonSerializable()
class SubmitTranslateSingleQuestionRequest {
  @JsonKey(name: 'examId')
  int? examId;
  @JsonKey(name: 'studentUserId')
  int? studentUserId;
  @JsonKey(name: 'questionId')
  int? questionId;
  @JsonKey(name: 'answerText')
  String? answerText;

  SubmitTranslateSingleQuestionRequest({
    this.examId,
    this.studentUserId,
    this.questionId,
    this.answerText,
  });

  factory SubmitTranslateSingleQuestionRequest.fromJson(
          Map<String, dynamic> json) =>
      _$SubmitTranslateSingleQuestionRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SubmitTranslateSingleQuestionRequestToJson(this);
}


class ChargeAmountRequest{
  final int amount;
  final int eduCompId;
  final int paymentMethodId;
  final int paymentPlanId;

  ChargeAmountRequest(this.amount , this.eduCompId , this.paymentMethodId , this.paymentPlanId);
}



@JsonSerializable()
class EmailMobileRequest {
  @JsonKey(name: 'email')
  String? emailMobile;
  @JsonKey(name: 'mobile')
  String? mobile;


  EmailMobileRequest({
    this.emailMobile,
    this.mobile,
  });

  factory EmailMobileRequest.fromJson(
      Map<String, dynamic> json) =>
      _$EmailMobileRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EmailMobileRequestToJson(this);
}
