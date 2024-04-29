import 'package:gamification/data/network/app_api.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/data/responses/course/course_response.dart';
import 'package:gamification/data/responses/course/subject_response.dart';
import 'package:gamification/data/responses/exam/exam_details_response.dart';
import 'package:gamification/data/responses/exam/exam_result_response.dart';
import 'package:gamification/data/responses/exam/submit_exam_response.dart';
import 'package:gamification/data/responses/exam/submit_single_matching_question_res.dart';
import 'package:gamification/data/responses/exam/submit_single_question_response.dart';
import 'package:gamification/data/responses/gift_gallery/all_gifts_response.dart';
import 'package:gamification/data/responses/gift_gallery/buy_gift_response.dart';
import 'package:gamification/data/responses/gift_gallery/gift_by_user_id_response.dart';
import 'package:gamification/data/responses/gift_gallery/gift_gallery_response.dart';
import 'package:gamification/data/responses/help_support/help_support_response.dart';
import 'package:gamification/data/responses/lecture_parts/lecture_parts_response.dart';
import 'package:gamification/data/responses/login/login_response.dart';
import 'package:gamification/data/responses/map/map_response.dart';
import 'package:gamification/data/responses/payment/all_pament_methods_response.dart';
import 'package:gamification/data/responses/profile/profile_response.dart';
import 'package:gamification/data/responses/question/single_question_history_response.dart';
import 'package:gamification/data/responses/question/single_question_response.dart';
import 'package:gamification/data/responses/register/register_response.dart';
import 'package:gamification/data/responses/request/all_courses_response.dart';
import 'package:gamification/data/responses/request/category_subcourse_response.dart';
import 'package:gamification/data/responses/request/course_category_response.dart';
import 'package:gamification/data/responses/request/learning_request_response.dart';
import 'package:gamification/data/responses/request/success_request_response.dart';
import 'package:gamification/data/responses/request/teaching_request_response.dart';
import 'package:gamification/data/responses/searched_units/searched_unit_response.dart';
import 'package:gamification/data/responses/student_rank/student_rank_response.dart';
import 'package:gamification/data/responses/sub_course/sub_course_response.dart';
import 'package:gamification/data/responses/subject_progress/subject_progress_details.dart';
import 'package:gamification/data/responses/unit_data/unit_data_response.dart';
import 'package:gamification/data/responses/unit_files/unit_files_response.dart';
import 'package:gamification/data/responses/user_points/user_points_response.dart';

import '../responses/check_balance/check_balance_response.dart';
import '../responses/payment/plans_response.dart';
import '../responses/streak_response/streak_response.dart';
import '../responses/subject_progress/subjects_progress.dart';
import '../responses/subjects_of_year/subjects_of_year.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);

  Future<RegisterResponse> register(RegisterRequest registerRequest);

  Future<ProfileResponse> returnProfile();

  Future<StudentRankResponse> getStudentRank();

  Future<CourseMainResponse> getBasicRecommendedCourses();

  Future<UserPointsResponse> getPointsOfUser();

  Future<GiftGalleryResponse> getGiftGallery();

  Future<StreakResponse> getUesrStreak();

  Future<EditProfileResponse> editProfile(
      EditProfileRequest editProfileRequest);

  Future<ExamDetailsResponse> examDetails(int examId);

  Future<SubjectProgressIdResponse> subjectProgressDetails(int id);

  Future<SubmitSingleQuestionResponse> submitSingleQuestion(
      SubmitSingleQuestionRequest submitSingleQuestionRequest);

  Future<SubmitSingleQuestionResponse> submitMCQSingleQuestion(
      SubmitMCQSingleQuestionRequest submitMCQSingleQuestionRequest);

  Future<SubmitExamResponse> submitExam(SubmitExamRequest submitExamRequest);

  Future<ExamResultResponse> examResults(int examId);

  Future<RequestTeachingResponse> getAllTeachingCourseRequests(int pageId);

  Future<SuccessRequestResponse> addTeachingRequest(
    AddTeachingRequest addTeachingRequest,
  );

  Future<SuccessRequestResponse> deleteTeachingRequest(int requestId);

  Future<BuyGiftResponse> buyGift(int giftId);

  Future<RequestLearningResponse> getAllCourseRequests(int pageId);

  Future<SuccessRequestResponse> addCourseRequest(
    AddCourseRequest addCourseRequest,
  );

  Future<SuccessRequestResponse> deleteCourseRequest(int requestId);

  Future<AllCoursesRequestResponse> getAllCoursesRequest();

  Future<List<SearchedUnitResponse>> returnSearchedUnitsBySubjectId(
      int subjectId);

  Future<UnitDataResponse> getAllUnitDate(int unitId);

  Future<SubCourseResponse> getSubCourseById(int courseId);

  Future<UnitFileResponse> getAllUnitFile(int unitId);

  Future<AllCourseCategoryResponse> getAllRequestCategories();
  Future<CheckBalanceResponse> checkBalance();

  Future<List<CategorySubCourseResponse>> getSubCourseByCategoryId(
    int categoryId,
  );

  Future<LecturePartsResponse> getLessonPartsAndExams(
    int lessonId,
  );

  Future<SuccessRequestResponse> createViewRow(
    int materialId,
    int partId,
  );

  Future<SuccessRequestResponse> incrementView(
    int materialId,
    int partId,
  );

  Future<List<SubjectUnitResponse>> returnContentBySubjectId(int subjectId);

  Future<HelpSupportResponse> getHelpAndSupport();

  Future<AllGiftsResponse> getAllGifts();

  Future<List<GiftByUserIdResponse>> getGiftByUserId();

  Future<AssignGiftResponse> assignGiftToUser(
      AssignGiftToUserRequest assignGiftToUserRequest);

  Future<SubmitSingleQuestionResponse> submitSingleQuestionHistory(
      SubmitSingleQuestionRequest submitSingleQuestionRequest);

  Future<SubmitSingleQuestionResponse> submitMCQSingleQuestionHistory(
      SubmitMCQSingleQuestionRequest submitSingleQuestionRequest);

  Future<StudentSubjectsResponse> getAllSubjects();

  Future<SubjectsProgressResponse> getAllSubjectsProgress();

  Future<MapResponse> getSubjectMapById(int id);

  Future<SingleQuestionHistoryResponse> submitSingleCompleteQuestionHistory(
    SubmitSingleQuestionRequest submitSingleQuestionRequest,
  );

  Future<SingleQuestionHistoryResponse> submitSingleContainerQuestionHistory(
    SubmitSingleQuestionRequest submitSingleQuestionRequest,
  );

  Future<SingleQuestionResponse> submitSingleContainerQuestion(
    ContainerSubmitSingleQuestionRequest containerSubmitSingleQuestionRequest,
  );

  Future<SingleQuestionResponse> submitSingleCompleteQuestion(
    CompleteSubmitSingleQuestionRequest completeSubmitSingleQuestionRequest,
  );

  Future<String> deleteUser(int userId);

  Future<AllPaymentMethodsResponse> getAllPaymentMethod();

  Future<PlansResponse> getAllPaymentPlans();

  Future<SubmitSingleMatchingQuestionResponse> submitSingleMatchingQuestion(
      SubmitMatchingQuestionRequest submitMatchingQuestionRequest);

  Future<SubmitSingleMatchingQuestionHistoryResponse>
      submitSingleMatchingQuestionHistory(
          SubmitMatchingQuestionRequestHistory
              submitMatchingQuestionRequestHistory);

  Future<SubmitSingleQVoiceQuestionResponse> submitSingleQVoiceQuestion(
      SubmitSingleVoiceQuestionRequest singleVoiceQuestionRequest);

  Future<SingleQuestionResponse> submitTranslateSingleQuestion(
    SubmitTranslateSingleQuestionRequest submitTranslateSingleQuestionRequest,
  );

  Future<List<AllStagesResponse>> getAllStages(String? lang);

  Future<AllEduYearsResponse> getAllEduYearsId(int stageId);

  Future<ChargeAmountResponse> chargeAmount(
      int amount, int eduCompId, int paymentMethodId, int paymentPlanId);

  Future<CheckEmailAndPhoneResponse> checkMobileAndEmail(
      EmailMobileRequest emailMobileRequest);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return _appServiceClient.login(loginRequest);
  }

  @override
  Future<ProfileResponse> returnProfile() {
    return _appServiceClient.returnProfile();
  }

  @override
  Future<EditProfileResponse> editProfile(
      EditProfileRequest editProfileRequest) {
    return _appServiceClient.editProfile(editProfileRequest);
  }

  @override
  Future<CourseMainResponse> getBasicRecommendedCourses() {
    return _appServiceClient.getBasicRecommendedCourses();
  }

  @override
  Future<UserPointsResponse> getPointsOfUser() {
    return _appServiceClient.getPointsOfUser();
  }

  @override
  Future<GiftGalleryResponse> getGiftGallery() {
    return _appServiceClient.getGiftGallery();
  }

  @override
  Future<ExamDetailsResponse> examDetails(int examId) {
    return _appServiceClient.examDetails(examId);
  }

  @override
  Future<SubjectProgressIdResponse> subjectProgressDetails(int id) {
    return _appServiceClient.subjectProgressDetails(id);
  }

  @override
  Future<SubmitSingleQuestionResponse> submitSingleQuestion(
      SubmitSingleQuestionRequest submitSingleQuestionRequest) {
    return _appServiceClient.submitSingleQuestion(submitSingleQuestionRequest);
  }

  @override
  Future<SubmitExamResponse> submitExam(SubmitExamRequest submitExamRequest) {
    return _appServiceClient.submitExam(submitExamRequest);
  }

  @override
  Future<ExamResultResponse> examResults(int examId) {
    return _appServiceClient.examResults(examId);
  }

  @override
  Future<RequestTeachingResponse> getAllTeachingCourseRequests(int pageId) {
    return _appServiceClient.getAllTeachingCourseRequests(pageId);
  }

  @override
  Future<SuccessRequestResponse> addTeachingRequest(
    AddTeachingRequest addTeachingRequest,
  ) {
    return _appServiceClient.addTeachingRequest(addTeachingRequest);
  }

  @override
  Future<SuccessRequestResponse> deleteTeachingRequest(int requestId) {
    return _appServiceClient.deleteTeachingRequest(requestId);
  }

  @override
  Future<BuyGiftResponse> buyGift(int giftId) {
    return _appServiceClient.buyGift(giftId);
  }

  @override
  Future<RequestLearningResponse> getAllCourseRequests(int pageId) {
    return _appServiceClient.getAllCourseRequests(pageId);
  }

  @override
  Future<SuccessRequestResponse> addCourseRequest(
    AddCourseRequest addCourseRequest,
  ) {
    return _appServiceClient.addCourseRequest(addCourseRequest);
  }

  @override
  Future<SuccessRequestResponse> deleteCourseRequest(int requestId) {
    return _appServiceClient.deleteCourseRequest(requestId);
  }

  @override
  Future<AllCoursesRequestResponse> getAllCoursesRequest() {
    return _appServiceClient.getAllCoursesRequest();
  }

  @override
  Future<UnitDataResponse> getAllUnitDate(int unitId) {
    return _appServiceClient.getAllUnitDate(unitId);
  }

  @override
  Future<SubCourseResponse> getSubCourseById(int courseId) {
    return _appServiceClient.getSubCourseById(courseId);
  }

  @override
  Future<List<SearchedUnitResponse>> returnSearchedUnitsBySubjectId(
      int subjectId) {
    return _appServiceClient.returnSearchedUnitsBySubjectId(subjectId);
  }

  @override
  Future<UnitFileResponse> getAllUnitFile(int unitId) {
    return _appServiceClient.getAllUnitFile(unitId);
  }

  @override
  Future<AllCourseCategoryResponse> getAllRequestCategories() {
    return _appServiceClient.getAllRequestCategories();
  }

  @override
  Future<List<CategorySubCourseResponse>> getSubCourseByCategoryId(
    int categoryId,
  ) {
    return _appServiceClient.getSubCourseByCategoryId(categoryId);
  }

  @override
  Future<LecturePartsResponse> getLessonPartsAndExams(int lessonId) {
    return _appServiceClient.getLessonPartsAndExams(lessonId);
  }

  @override
  Future<SuccessRequestResponse> incrementView(int materialId, int partId) {
    return _appServiceClient.incrementView(materialId, partId);
  }

  @override
  Future<SuccessRequestResponse> createViewRow(int materialId, int partId) {
    return _appServiceClient.createViewRow(materialId, partId);
  }

  @override
  Future<List<SubjectUnitResponse>> returnContentBySubjectId(int subjectId) {
    return _appServiceClient.returnContentBySubjectId(subjectId);
  }

  @override
  Future<StudentRankResponse> getStudentRank() {
    return _appServiceClient.getStudentRank();
  }

  @override
  Future<HelpSupportResponse> getHelpAndSupport() {
    return _appServiceClient.getHelpAndSupport();
  }

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) {
    return _appServiceClient.register(registerRequest);
  }

  @override
  Future<AllGiftsResponse> getAllGifts() {
    return _appServiceClient.getAllGifts();
  }

  @override
  Future<List<GiftByUserIdResponse>> getGiftByUserId() {
    return _appServiceClient.getGiftByUserId();
  }

  @override
  Future<AssignGiftResponse> assignGiftToUser(
      AssignGiftToUserRequest assignGiftToUserRequest) {
    return _appServiceClient.assignGiftToUser(assignGiftToUserRequest);
  }

  @override
  Future<SubmitSingleQuestionResponse> submitSingleQuestionHistory(
      SubmitSingleQuestionRequest submitSingleQuestionRequest) {
    return _appServiceClient
        .submitSingleQuestionHistory(submitSingleQuestionRequest);
  }

  @override
  Future<StudentSubjectsResponse> getAllSubjects() {
    return _appServiceClient.getAllSubjects();
  }

  @override
  Future<SubjectsProgressResponse> getAllSubjectsProgress() {
    return _appServiceClient.getSubjectsProgress();
  }

  @override
  Future<MapResponse> getSubjectMapById(int id) {
    return _appServiceClient.getSubjectMapById(id);
  }

  @override
  Future<SingleQuestionResponse> submitSingleCompleteQuestion(
    CompleteSubmitSingleQuestionRequest completeSubmitSingleQuestionRequest,
  ) {
    return _appServiceClient.submitSingleCompleteQuestion(
      completeSubmitSingleQuestionRequest,
    );
  }

  @override
  Future<SingleQuestionHistoryResponse> submitSingleCompleteQuestionHistory(
    SubmitSingleQuestionRequest submitSingleQuestionRequest,
  ) {
    return _appServiceClient.submitSingleCompleteQuestionHistory(
      submitSingleQuestionRequest,
    );
  }

  @override
  Future<SingleQuestionResponse> submitSingleContainerQuestion(
    ContainerSubmitSingleQuestionRequest containerSubmitSingleQuestionRequest,
  ) {
    return _appServiceClient.submitSingleContainerQuestion(
      containerSubmitSingleQuestionRequest,
    );
  }

  @override
  Future<SingleQuestionHistoryResponse> submitSingleContainerQuestionHistory(
    SubmitSingleQuestionRequest submitSingleQuestionRequest,
  ) {
    return _appServiceClient.submitSingleContainerQuestionHistory(
      submitSingleQuestionRequest,
    );
  }

  @override
  Future<String> deleteUser(int userId) {
    return _appServiceClient.deleteUser(
      userId,
    );
  }

  @override
  Future<AllPaymentMethodsResponse> getAllPaymentMethod() {
    return _appServiceClient.getAllPaymentMethod();
  }

  @override
  Future<PlansResponse> getAllPaymentPlans() {
    return _appServiceClient.getAllPaymentPlans();
  }

  @override
  Future<SubmitSingleQuestionResponse> submitMCQSingleQuestion(
      SubmitMCQSingleQuestionRequest submitMCQSingleQuestionRequest) {
    return _appServiceClient
        .submitMCQSingleQuestion(submitMCQSingleQuestionRequest);
  }

  @override
  Future<SubmitSingleQuestionResponse> submitMCQSingleQuestionHistory(
      SubmitMCQSingleQuestionRequest submitSingleQuestionRequest) {
    return _appServiceClient
        .submitMCQSingleQuestionHistory(submitSingleQuestionRequest);
  }

  @override
  Future<SubmitSingleMatchingQuestionResponse> submitSingleMatchingQuestion(
      SubmitMatchingQuestionRequest submitMatchingQuestionRequest) {
    return _appServiceClient
        .submitSingleMatchingQuestion(submitMatchingQuestionRequest);
  }

  @override
  Future<SubmitSingleMatchingQuestionHistoryResponse>
      submitSingleMatchingQuestionHistory(
          SubmitMatchingQuestionRequestHistory
              submitMatchingQuestionRequestHistory) {
    return _appServiceClient.submitSingleMatchingQuestionHistory(
        submitMatchingQuestionRequestHistory);
  }

  @override
  Future<SubmitSingleQVoiceQuestionResponse> submitSingleQVoiceQuestion(
      SubmitSingleVoiceQuestionRequest singleVoiceQuestionRequest) {
    return _appServiceClient
        .submitSingleQVoiceQuestion(singleVoiceQuestionRequest);
  }

  @override
  Future<SingleQuestionResponse> submitTranslateSingleQuestion(
    SubmitTranslateSingleQuestionRequest submitTranslateSingleQuestionRequest,
  ) {
    return _appServiceClient.submitTranslateSingleQuestion(
      submitTranslateSingleQuestionRequest,
    );
  }

  @override
  Future<List<AllStagesResponse>> getAllStages(String? lang) {
    return _appServiceClient.getStagesID(lang ?? '');
  }

  @override
  Future<AllEduYearsResponse> getAllEduYearsId(int stageId) {
    return _appServiceClient.getEduYearsID(stageId);
  }

  @override
  Future<ChargeAmountResponse> chargeAmount(
      int amount, int eduCompId, int paymentMethodId, int paymentPlanId) {
    return _appServiceClient.chargeAmount(
        amount, eduCompId, paymentMethodId, paymentPlanId);
  }

  @override
  Future<CheckBalanceResponse> checkBalance() {
    return _appServiceClient.checkBalance();
  }

  @override
  Future<CheckEmailAndPhoneResponse> checkMobileAndEmail(
      EmailMobileRequest emailMobileRequest) {
    return _appServiceClient.checkMobileAndEmail(emailMobileRequest);
  }

  @override
  Future<StreakResponse> getUesrStreak() {
    return _appServiceClient.getUesrStreak();
  }
}
