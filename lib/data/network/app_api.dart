import 'package:dio/dio.dart';
import 'package:gamification/app/constants.dart';
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
import 'package:gamification/data/responses/payment/plans_response.dart';
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
import 'package:gamification/data/responses/sub_course/sub_course_response.dart';
import 'package:gamification/data/responses/subject_progress/subjects_progress.dart';
import 'package:gamification/data/responses/unit_data/unit_data_response.dart';
import 'package:gamification/data/responses/unit_files/unit_files_response.dart';
import 'package:gamification/data/responses/user_points/user_points_response.dart';
import 'package:retrofit/http.dart';

import '../responses/check_balance/check_balance_response.dart';
import '../responses/streak_response/streak_response.dart';
import '../responses/student_rank/student_rank_response.dart';
import '../responses/subject_progress/subject_progress_details.dart';
import '../responses/subjects_of_year/subjects_of_year.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("api/user/login")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST("api/APIUsers/Register")
  Future<RegisterResponse> register(@Body() RegisterRequest registerRequest);

  @GET("api/AJAX/returnProfile")
  Future<ProfileResponse> returnProfile();

  @GET("api/studentRank")
  Future<StudentRankResponse> getStudentRank();

  @GET("api/Admin/getAllSubjectFroCustomEducationalYear")
  Future<StudentSubjectsResponse> getAllSubjects();

  @GET("api/Subject/getAllSubjectByEducationalYearOfStudent")
  Future<SubjectsProgressResponse> getSubjectsProgress();

  @GET("api/UserSubject/getBasicRecommendedCourses")
  Future<CourseMainResponse> getBasicRecommendedCourses();

  @GET("api/Admin/getPointsOfUser")
  Future<UserPointsResponse> getPointsOfUser();
  @GET("api/user/StreakCounter")
  Future<StreakResponse> getUesrStreak();

  @GET("api/Admin/getGiftGallery")
  Future<GiftGalleryResponse> getGiftGallery();

  @POST("api/AJAX/editProfile")
  Future<EditProfileResponse> editProfile(
      @Body() EditProfileRequest editProfileRequest);

  @GET("api/Exam/Details/{examId}")
  Future<ExamDetailsResponse> examDetails(@Path() int examId);

  @GET("api/Subject/getAllSubjectContentById/{id}")
  Future<SubjectProgressIdResponse> subjectProgressDetails(@Path() int id);

  @POST("api/Exam/SubmitSingleQuestion")
  Future<SubmitSingleQuestionResponse> submitSingleQuestion(
    @Body() SubmitSingleQuestionRequest submitSingleQuestionRequest,
  );

  @POST("api/Exam/SubmitSingleQuestion")
  Future<SubmitSingleQuestionResponse> submitMCQSingleQuestion(
    @Body() SubmitMCQSingleQuestionRequest submitSingleQuestionRequest,
  );

  @POST("api/Exam/SubmitSingleQuestionHistory")
  Future<SubmitSingleQuestionResponse> submitSingleQuestionHistory(
    @Body() SubmitSingleQuestionRequest submitSingleQuestionRequest,
  );

  @POST("api/Exam/SubmitSingleQuestionHistory")
  Future<SubmitSingleQuestionResponse> submitMCQSingleQuestionHistory(
    @Body() SubmitMCQSingleQuestionRequest submitSingleQuestionRequest,
  );

  @POST("api/Exam/Submit")
  Future<SubmitExamResponse> submitExam(
      @Body() SubmitExamRequest submitExamRequest);

  @POST("api/Exam/Results/{examId}")
  Future<ExamResultResponse> examResults(@Path() int examId);

  @GET("api/Employee/TeachingRequest/getAllTeachingCourseRequests/{pageId}")
  Future<RequestTeachingResponse> getAllTeachingCourseRequests(
      @Path() int pageId);

  @POST("api/Employee/TeachingRequest/addTeachingRequest")
  Future<SuccessRequestResponse> addTeachingRequest(
    @Body() AddTeachingRequest addTeachingRequest,
  );

  @DELETE("api/admin/TeachingRequest/deleteRequest/{requestId}")
  Future<SuccessRequestResponse> deleteTeachingRequest(@Path() int requestId);

  @GET("api/Admin/buyGift/{giftId}")
  Future<BuyGiftResponse> buyGift(@Path() int giftId);

  @GET("api/Employee/CourseRequest/getAllCourseRequests/{pageId}")
  Future<RequestLearningResponse> getAllCourseRequests(@Path() int pageId);

  @POST("api/Employee/CourseRequest/addCourseRequest")
  Future<SuccessRequestResponse> addCourseRequest(
    @Body() AddCourseRequest addCourseRequest,
  );

  @DELETE("api/admin/CourseRequest/deleteRequest/{requestId}")
  Future<SuccessRequestResponse> deleteCourseRequest(@Path() int requestId);

  @GET("api/CourseRequest/getAllCourses")
  Future<AllCoursesRequestResponse> getAllCoursesRequest();

  @GET("api/Admin/returnSearchedUnitsBySubjectId/{subjectId}")
  Future<List<SearchedUnitResponse>> returnSearchedUnitsBySubjectId(
      @Path() int subjectId);

  @GET("api/Admin/GetAllUnitDate/{unitId}")
  Future<UnitDataResponse> getAllUnitDate(@Path() int unitId);

  @GET("api/SubCourse/getSubCourseById/{courseId}")
  Future<SubCourseResponse> getSubCourseById(@Path() int courseId);

  @GET("api/Admin/GetAllUnitFile/{unitId}")
  Future<UnitFileResponse> getAllUnitFile(@Path() int unitId);

  @GET("api/courseCategory/getAllCategories")
  Future<AllCourseCategoryResponse> getAllRequestCategories();

  @GET("api/SubCourse/getSubCourseByCategoryId/{categoryId}")
  Future<List<CategorySubCourseResponse>> getSubCourseByCategoryId(
      @Path() int categoryId);

  @GET("api/Materials/getLessonPartsAndExams/{lessonId}")
  Future<LecturePartsResponse> getLessonPartsAndExams(
    @Path() int lessonId,
  );

  @POST("api/APIMaterials/createViewRow/{materialId}/{partId}")
  Future<SuccessRequestResponse> createViewRow(
    @Path() int materialId,
    @Path() int partId,
  );

  @GET("api/APIMaterials/incrementView/{materialId}/{partId}")
  Future<SuccessRequestResponse> incrementView(
    @Path() int materialId,
    @Path() int partId,
  );

  @GET("api/Admin/returnContentBySubjectId/{subjectId}")
  Future<List<SubjectUnitResponse>> returnContentBySubjectId(
      @Path() int subjectId);

  @GET("api/APIUsers/helpAndSupport")
  Future<HelpSupportResponse> getHelpAndSupport();

  @GET("api/Admin/getGiftsBank")
  Future<AllGiftsResponse> getAllGifts();

  @GET("api/Admin/GetGiftsByUser")
  Future<List<GiftByUserIdResponse>> getGiftByUserId();

  @POST("api/AssignGiftToUser")
  Future<AssignGiftResponse> assignGiftToUser(
      @Body() AssignGiftToUserRequest assignGiftToUserRequest);

  @GET("api/subject/getSubjectMapById/{id}")
  Future<MapResponse> getSubjectMapById(@Path() int id);

  @POST("api/Exam/SubmitSingleContainerQuestionHistory")
  Future<SingleQuestionHistoryResponse> submitSingleContainerQuestionHistory(
    @Body() SubmitSingleQuestionRequest submitSingleQuestionRequest,
  );

  @POST("api/Exam/SubmitSingleCompleteQuestionHistory")
  Future<SingleQuestionHistoryResponse> submitSingleCompleteQuestionHistory(
    @Body() SubmitSingleQuestionRequest submitSingleQuestionRequest,
  );

  @POST("api/Exam/SubmitSingleContainerQuestion")
  Future<SingleQuestionResponse> submitSingleContainerQuestion(
    @Body()
    ContainerSubmitSingleQuestionRequest containerSubmitSingleQuestionRequest,
  );

  @POST("api/Exam/SubmitSingleCompleteQuestion")
  Future<SingleQuestionResponse> submitSingleCompleteQuestion(
    @Body()
    CompleteSubmitSingleQuestionRequest completeSubmitSingleQuestionRequest,
  );

  @DELETE("api/APIUsers/deleteUser/{userId}")
  Future<String> deleteUser(@Path() int userId);

  @GET("api/AJAX/getallPaymentMethod")
  Future<AllPaymentMethodsResponse> getAllPaymentMethod();

  @GET("api/AJAX/getallPaymentPlans")
  Future<PlansResponse> getAllPaymentPlans();
  @GET("api/AJAX/balanceCheck")
  Future<CheckBalanceResponse>checkBalance();

  @POST("api/Exam/SubmitSingleMatchingQuestion")
  Future<SubmitSingleMatchingQuestionResponse> submitSingleMatchingQuestion(
      @Body() SubmitMatchingQuestionRequest submitMatchingQuestionRequest);

  @POST("api/Exam/SubmitSingleMatchingQuestionHistory")
  Future<SubmitSingleMatchingQuestionHistoryResponse>
      submitSingleMatchingQuestionHistory(
          @Body()
          SubmitMatchingQuestionRequestHistory
              submitMatchingQuestionRequestHistory);

  @POST("api/Exam/SubmitSingleVoiceQuestion")
  Future<SubmitSingleQVoiceQuestionResponse> submitSingleQVoiceQuestion(
      @Body() SubmitSingleVoiceQuestionRequest singleVoiceQuestionRequest);

  @POST("api/Exam/SubmitTranslateSingleQuestion")
  Future<SingleQuestionResponse> submitTranslateSingleQuestion(
    @Body()
    SubmitTranslateSingleQuestionRequest submitTranslateSingleQuestionRequest,
  );

  @GET("api/Admin/getEducationaStages/{lang}")
  Future<List<AllStagesResponse>> getStagesID(@Path() String lang);

  @GET("api/Admin/educationalYear/{stageId}")
  Future<AllEduYearsResponse> getEduYearsID(@Path() int stageId);



  @POST(
      "api/AJAX/chargeAmount/{amount}/{eduCompId}/{paymentMethodId}/{paymentPlanId}")
  Future<ChargeAmountResponse> chargeAmount(
      @Path() int amount,
      @Path() int eduCompId,
      @Path() int paymentMethodId,
      @Path() int paymentPlanId);


  @POST("api/user/checkMobileAndEmail")
  Future<CheckEmailAndPhoneResponse> checkMobileAndEmail(
      @Body() EmailMobileRequest emailMobileRequest);
}
