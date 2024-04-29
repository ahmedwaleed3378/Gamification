// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      accountEmail: json['account_email'] as String?,
      accountPassword: json['account_password'] as String?,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'account_email': instance.accountEmail,
      'account_password': instance.accountPassword,
    };

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      userTypeId: json['userTypeId'] as int?,
      arName: json['ar_name'] as String?,
      mobile: json['mobile'] as String?,
      accountEmail: json['account_email'] as String?,
      accountPassword: json['account_password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      stageID: json['stageID'] as int?,
      eduYearID: json['EduYearID'] as int?,
    )..id = json['Id'] as int?;

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'userTypeId': instance.userTypeId,
      'ar_name': instance.arName,
      'mobile': instance.mobile,
      'account_email': instance.accountEmail,
      'account_password': instance.accountPassword,
      'confirmPassword': instance.confirmPassword,
      'stageID': instance.stageID,
      'EduYearID': instance.eduYearID,
    };

EditProfileRequest _$EditProfileRequestFromJson(Map<String, dynamic> json) =>
    EditProfileRequest(
      arName: json['ar_name'] as String?,
      mobile: json['mobile'] as String?,
      accountEmail: json['account_email'] as String?,
      accountPassword: json['account_password'] as String?,
      newPassword: json['newPassword'] as String?,
      confirmPassword: json['ConfirmPassword'] as String?,
      userPictureProfile: json['profilePicture'] == null
          ? null
          : UserPictureProfile.fromJson(
              json['profilePicture'] as Map<String, dynamic>),
      eduYearId: json['eduYearId'] as int?,
    );

Map<String, dynamic> _$EditProfileRequestToJson(EditProfileRequest instance) =>
    <String, dynamic>{
      'ar_name': instance.arName,
      'mobile': instance.mobile,
      'account_email': instance.accountEmail,
      'account_password': instance.accountPassword,
      'newPassword': instance.newPassword,
      'ConfirmPassword': instance.confirmPassword,
      'profilePicture': instance.userPictureProfile,
      'eduYearId': instance.eduYearId,
    };

UserPictureProfile _$UserPictureProfileFromJson(Map<String, dynamic> json) =>
    UserPictureProfile(
      fileAsBase64: json['FileAsBase64'] as String?,
      name: json['name'] as String?,
      size: json['size'] as int?,
      type: json['type'] as String?,
      lastModified: json['LastModified'] as int?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
    );

Map<String, dynamic> _$UserPictureProfileToJson(UserPictureProfile instance) =>
    <String, dynamic>{
      'FileAsBase64': instance.fileAsBase64,
      'name': instance.name,
      'size': instance.size,
      'type': instance.type,
      'LastModified': instance.lastModified,
      'LastModifiedDate': instance.lastModifiedDate,
    };

SubmitSingleQuestionHistoryRequest _$SubmitSingleQuestionHistoryRequestFromJson(
        Map<String, dynamic> json) =>
    SubmitSingleQuestionHistoryRequest(
      examId: json['examId'] as int?,
      studentUserId: json['studentUserId'] as int?,
      questionId: json['questionId'] as int?,
      questionSentenceId: json['question_sentence_id'] as int?,
      questionAnswerId: json['question_answer_id'] as int?,
    );

Map<String, dynamic> _$SubmitSingleQuestionHistoryRequestToJson(
        SubmitSingleQuestionHistoryRequest instance) =>
    <String, dynamic>{
      'examId': instance.examId,
      'studentUserId': instance.studentUserId,
      'questionId': instance.questionId,
      'question_sentence_id': instance.questionSentenceId,
      'question_answer_id': instance.questionAnswerId,
    };

SubmitSingleQuestionRequest _$SubmitSingleQuestionRequestFromJson(
        Map<String, dynamic> json) =>
    SubmitSingleQuestionRequest(
      examId: json['examId'] as int?,
      studentUserId: json['studentUserId'] as int?,
      questionId: json['questionId'] as int?,
      questionSentenceId: json['question_sentence_id'] as int?,
      questionAnswerId: json['question_answer_id'] as int?,
    );

Map<String, dynamic> _$SubmitSingleQuestionRequestToJson(
        SubmitSingleQuestionRequest instance) =>
    <String, dynamic>{
      'examId': instance.examId,
      'studentUserId': instance.studentUserId,
      'questionId': instance.questionId,
      'question_sentence_id': instance.questionSentenceId,
      'question_answer_id': instance.questionAnswerId,
    };

SubmitMCQSingleQuestionRequest _$SubmitMCQSingleQuestionRequestFromJson(
        Map<String, dynamic> json) =>
    SubmitMCQSingleQuestionRequest(
      examId: json['examId'] as int?,
      studentUserId: json['studentUserId'] as int?,
      questionId: json['questionId'] as int?,
      pickedChoiceId: json['PickedChoiceId'] as int?,
    );

Map<String, dynamic> _$SubmitMCQSingleQuestionRequestToJson(
        SubmitMCQSingleQuestionRequest instance) =>
    <String, dynamic>{
      'examId': instance.examId,
      'studentUserId': instance.studentUserId,
      'questionId': instance.questionId,
      'PickedChoiceId': instance.pickedChoiceId,
    };

ContainerSubmitSingleQuestionRequest
    _$ContainerSubmitSingleQuestionRequestFromJson(Map<String, dynamic> json) =>
        ContainerSubmitSingleQuestionRequest(
          examId: json['examId'] as int?,
          studentUserId: json['studentUserId'] as int?,
          questionId: json['questionId'] as int?,
          questionDetails: (json['questionDetails'] as List<dynamic>?)
              ?.map((e) =>
                  ContainerQuestionDetails.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$ContainerSubmitSingleQuestionRequestToJson(
        ContainerSubmitSingleQuestionRequest instance) =>
    <String, dynamic>{
      'examId': instance.examId,
      'studentUserId': instance.studentUserId,
      'questionId': instance.questionId,
      'questionDetails': instance.questionDetails,
    };

CompleteSubmitSingleQuestionRequest
    _$CompleteSubmitSingleQuestionRequestFromJson(Map<String, dynamic> json) =>
        CompleteSubmitSingleQuestionRequest(
          examId: json['examId'] as int?,
          studentUserId: json['studentUserId'] as int?,
          questionId: json['questionId'] as int?,
          questionDetails: (json['questionDetails'] as List<dynamic>?)
              ?.map((e) =>
                  CompleteQuestionDetails.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$CompleteSubmitSingleQuestionRequestToJson(
        CompleteSubmitSingleQuestionRequest instance) =>
    <String, dynamic>{
      'examId': instance.examId,
      'studentUserId': instance.studentUserId,
      'questionId': instance.questionId,
      'questionDetails': instance.questionDetails,
    };

ContainerQuestionDetails _$ContainerQuestionDetailsFromJson(
        Map<String, dynamic> json) =>
    ContainerQuestionDetails(
      questionSentenceId: json['question_sentence_id'] as int?,
      questionAnswerIds: (json['question_answer_ids'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$ContainerQuestionDetailsToJson(
        ContainerQuestionDetails instance) =>
    <String, dynamic>{
      'question_sentence_id': instance.questionSentenceId,
      'question_answer_ids': instance.questionAnswerIds,
    };

CompleteQuestionDetails _$CompleteQuestionDetailsFromJson(
        Map<String, dynamic> json) =>
    CompleteQuestionDetails(
      questionSentenceId: json['question_sentence_id'] as int?,
      questionAnswerIds: json['question_answer_id'] as int?,
    );

Map<String, dynamic> _$CompleteQuestionDetailsToJson(
        CompleteQuestionDetails instance) =>
    <String, dynamic>{
      'question_sentence_id': instance.questionSentenceId,
      'question_answer_id': instance.questionAnswerIds,
    };

SubmitExamRequest _$SubmitExamRequestFromJson(Map<String, dynamic> json) =>
    SubmitExamRequest(
      examId: json['examId'] as int?,
      studentUserId: json['studentUserId'] as int?,
      solvedExamStudentID: json['solvedExamStudent_ID'] as int?,
      examStarTime: json['ExamStarTime'] as String?,
    );

Map<String, dynamic> _$SubmitExamRequestToJson(SubmitExamRequest instance) =>
    <String, dynamic>{
      'examId': instance.examId,
      'studentUserId': instance.studentUserId,
      'solvedExamStudent_ID': instance.solvedExamStudentID,
      'ExamStarTime': instance.examStarTime,
    };

AddTeachingRequest _$AddTeachingRequestFromJson(Map<String, dynamic> json) =>
    AddTeachingRequest(
      details: json['details'] as String?,
      numberOfDays: json['numberOfDays'] as int?,
      courseId: json['courseId'] as int?,
    );

Map<String, dynamic> _$AddTeachingRequestToJson(AddTeachingRequest instance) =>
    <String, dynamic>{
      'details': instance.details,
      'numberOfDays': instance.numberOfDays,
      'courseId': instance.courseId,
    };

AddCourseRequest _$AddCourseRequestFromJson(Map<String, dynamic> json) =>
    AddCourseRequest(
      reasonOfRequest: json['reasonOfRequest'] as String?,
      numberOfDays: json['numberOfDays'] as int?,
      courseId: json['courseId'] as int?,
    );

Map<String, dynamic> _$AddCourseRequestToJson(AddCourseRequest instance) =>
    <String, dynamic>{
      'reasonOfRequest': instance.reasonOfRequest,
      'numberOfDays': instance.numberOfDays,
      'courseId': instance.courseId,
    };

AssignGiftToUserRequest _$AssignGiftToUserRequestFromJson(
        Map<String, dynamic> json) =>
    AssignGiftToUserRequest(
      giftId: json['giftId'] as int?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$AssignGiftToUserRequestToJson(
        AssignGiftToUserRequest instance) =>
    <String, dynamic>{
      'giftId': instance.giftId,
      'quantity': instance.quantity,
    };

SubmitMatchingQuestionRequest _$SubmitMatchingQuestionRequestFromJson(
        Map<String, dynamic> json) =>
    SubmitMatchingQuestionRequest(
      examId: json['examId'] as int?,
      studentUserId: json['studentUserId'] as int?,
      questionId: json['questionId'] as int?,
      matchingAnswers: (json['matching_answers'] as List<dynamic>?)
          ?.map((e) => MatchingAnswers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubmitMatchingQuestionRequestToJson(
        SubmitMatchingQuestionRequest instance) =>
    <String, dynamic>{
      'examId': instance.examId,
      'studentUserId': instance.studentUserId,
      'questionId': instance.questionId,
      'matching_answers': instance.matchingAnswers,
    };

MatchingAnswers _$MatchingAnswersFromJson(Map<String, dynamic> json) =>
    MatchingAnswers(
      leftSideId: json['leftSideId'] as int?,
      rightSideId: json['rightSideId'] as int?,
    );

Map<String, dynamic> _$MatchingAnswersToJson(MatchingAnswers instance) =>
    <String, dynamic>{
      'leftSideId': instance.leftSideId,
      'rightSideId': instance.rightSideId,
    };

SubmitMatchingQuestionRequestHistory
    _$SubmitMatchingQuestionRequestHistoryFromJson(Map<String, dynamic> json) =>
        SubmitMatchingQuestionRequestHistory(
          examId: json['examId'] as int?,
          studentUserId: json['studentUserId'] as int?,
          questionId: json['questionId'] as int?,
          leftSideId: json['left_side_id'] as int?,
          rightSideId: json['right_side_id'] as int?,
        );

Map<String, dynamic> _$SubmitMatchingQuestionRequestHistoryToJson(
        SubmitMatchingQuestionRequestHistory instance) =>
    <String, dynamic>{
      'examId': instance.examId,
      'studentUserId': instance.studentUserId,
      'questionId': instance.questionId,
      'left_side_id': instance.leftSideId,
      'right_side_id': instance.rightSideId,
    };

SubmitSingleVoiceQuestionRequest _$SubmitSingleVoiceQuestionRequestFromJson(
        Map<String, dynamic> json) =>
    SubmitSingleVoiceQuestionRequest(
      examId: json['examId'] as int?,
      studentUserId: json['studentUserId'] as int?,
      questionId: json['questionId'] as int?,
      answerText: json['answerText'] as String?,
    );

Map<String, dynamic> _$SubmitSingleVoiceQuestionRequestToJson(
        SubmitSingleVoiceQuestionRequest instance) =>
    <String, dynamic>{
      'examId': instance.examId,
      'studentUserId': instance.studentUserId,
      'questionId': instance.questionId,
      'answerText': instance.answerText,
    };

SubmitTranslateSingleQuestionRequest
    _$SubmitTranslateSingleQuestionRequestFromJson(Map<String, dynamic> json) =>
        SubmitTranslateSingleQuestionRequest(
          examId: json['examId'] as int?,
          studentUserId: json['studentUserId'] as int?,
          questionId: json['questionId'] as int?,
          answerText: json['answerText'] as String?,
        );

Map<String, dynamic> _$SubmitTranslateSingleQuestionRequestToJson(
        SubmitTranslateSingleQuestionRequest instance) =>
    <String, dynamic>{
      'examId': instance.examId,
      'studentUserId': instance.studentUserId,
      'questionId': instance.questionId,
      'answerText': instance.answerText,
    };

EmailMobileRequest _$EmailMobileRequestFromJson(Map<String, dynamic> json) =>
    EmailMobileRequest(
      emailMobile: json['email'] as String?,
      mobile: json['mobile'] as String?,
    );

Map<String, dynamic> _$EmailMobileRequestToJson(EmailMobileRequest instance) =>
    <String, dynamic>{
      'email': instance.emailMobile,
      'mobile': instance.mobile,
    };
