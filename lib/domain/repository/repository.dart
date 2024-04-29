import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/courses/courses_model.dart';
import 'package:gamification/domain/model/courses/subject_model.dart';
import 'package:gamification/domain/model/editProfile/edit_profile.dart';
import 'package:gamification/domain/model/exam/exam_details_model.dart';
import 'package:gamification/domain/model/exam/exam_result_model.dart';
import 'package:gamification/domain/model/exam/submit_exam_model.dart';
import 'package:gamification/domain/model/exam/submit_single_matching_question.dart';
import 'package:gamification/domain/model/exam/submit_single_question_model.dart';
import 'package:gamification/domain/model/exam/submit_single_qvoice_model.dart';
import 'package:gamification/domain/model/gift_gallery/all_gifts_model.dart';
import 'package:gamification/domain/model/gift_gallery/buy_gift_model.dart';
import 'package:gamification/domain/model/gift_gallery/gift_by_user_id_model.dart';
import 'package:gamification/domain/model/gift_gallery/gift_gallery_model.dart';
import 'package:gamification/domain/model/help_support/help_support_model.dart';
import 'package:gamification/domain/model/lecture_parts/lecture_parts_model.dart';
import 'package:gamification/domain/model/login/login_model.dart';
import 'package:gamification/domain/model/map_model/map_model.dart';
import 'package:gamification/domain/model/payment/all_payment_methods_model.dart';
import 'package:gamification/domain/model/payment/charge_amount_model.dart';
import 'package:gamification/domain/model/payment/plans_model.dart';
import 'package:gamification/domain/model/profile/profile_model.dart';
import 'package:gamification/domain/model/question/single_question_history_model.dart';
import 'package:gamification/domain/model/question/single_question_model.dart';
import 'package:gamification/domain/model/register/register_model.dart';
import 'package:gamification/domain/model/request/all_courses_model.dart';
import 'package:gamification/domain/model/request/category_subcourse_model.dart';
import 'package:gamification/domain/model/request/course_category_model.dart';
import 'package:gamification/domain/model/request/request_learning_model.dart';
import 'package:gamification/domain/model/request/request_teaching_model.dart';
import 'package:gamification/domain/model/request/success_request_model.dart';
import 'package:gamification/domain/model/searched_unit/searched_unit_model.dart';
import 'package:gamification/domain/model/sub_course/sub_course_model.dart';
import 'package:gamification/domain/model/subject_progress/subject_progress_details.dart';
import 'package:gamification/domain/model/subject_progress/subjects_progress.dart';
import 'package:gamification/domain/model/unit_data/unit_data_model.dart';
import 'package:gamification/domain/model/unit_files/unit_files_model.dart';
import 'package:gamification/domain/model/user_points/user_points_model.dart';

import '../model/check_balance/check_balance.dart';
import '../model/streakModel/streak_model.dart';
import '../model/student_rank/student_rank_model.dart';
import '../model/subjects_of_year/student_subjects.dart';

abstract class Repository {
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest);

  Future<Either<Failure, RegisterModel>> register(
    RegisterRequest registerRequest,
  );

  Future<Either<Failure, ProfileModel>> returnProfile();
  
  Future<Either<Failure, StreakModel>> getUserStreak();

  Future<Either<Failure, StudentRankModel>> getStudentRank();

  Future<Either<Failure, StudentSubjectsModel>> getAllSubjects();

  Future<Either<Failure, SubjectsProgressModel>> getAllSubjectsProgress();

  Future<Either<Failure, CoursesModel>> getBasicRecommendedCourses();

  Future<Either<Failure, UserPointsModel>> getPointsOfUser();

  Future<Either<Failure, GiftGalleryModel>> getGiftGallery();

  Future<Either<Failure, EditProfileModel>> editProfile(
      EditProfileRequest editProfileRequest);

  Future<Either<Failure, ExamDetailsModel>> examDetails(int examId);

  Future<Either<Failure, SubjectProgressIdModel>> subjectProgressDetails(
      int id);

  Future<Either<Failure, SubmitSingleQuestionModel>> submitSingleQuestion(
      SubmitSingleQuestionRequest submitSingleQuestionRequest);

  Future<Either<Failure, SubmitSingleQuestionModel>> submitMCQSingleQuestion(
      SubmitMCQSingleQuestionRequest submitSingleQuestionRequest);

  Future<Either<Failure, SubmitExamModel>> submitExam(
      SubmitExamRequest submitExamRequest);

  Future<Either<Failure, ExamResultModel>> examResults(int examId);

  Future<Either<Failure, RequestTeachingModel>> getAllTeachingCourseRequests(
      int pageId);

  Future<Either<Failure, SuccessRequestModel>> addTeachingRequest(
    AddTeachingRequest addTeachingRequest,
  );

  Future<Either<Failure, SuccessRequestModel>> deleteTeachingRequest(
    int requestId,
  );

  Future<Either<Failure, BuyGiftModel>> buyGift(int giftId);

  Future<Either<Failure, RequestLearningModel>> getAllCourseRequests(
      int pageId);

  Future<Either<Failure, SuccessRequestModel>> addCourseRequest(
    AddCourseRequest addCourseRequest,
  );

  Future<Either<Failure, SuccessRequestModel>> deleteCourseRequest(
    int requestId,
  );

  Future<Either<Failure, AllCoursesRequestModel>> getAllCoursesRequest();
  Future<Either<Failure, CheckBalanceModel>> checkBalance();

  Future<Either<Failure, List<SearchedUnitModel>>>
      returnSearchedUnitsBySubjectId(int subjectId);

  Future<Either<Failure, UnitDataModel>> getAllUnitDate(int unitId);

  Future<Either<Failure, SubCourseModel>> getSubCourseById(int courseId);

  Future<Either<Failure, UnitFileModel>> getAllUnitFile(int unitId);

  Future<Either<Failure, CourseCategoryModel>> getAllRequestCategories();

  Future<Either<Failure, List<CategorySubCourseModel>>>
      getSubCourseByCategoryId(int categoryId);

  Future<Either<Failure, LecturePartsModel>> getLessonPartsAndExams(
    int lessonId,
  );

  Future<Either<Failure, SuccessRequestModel>> incrementView(
    int materialId,
    int partId,
  );

  Future<Either<Failure, SuccessRequestModel>> createViewRow(
    int materialId,
    int partId,
  );

  Future<Either<Failure, List<SubjectUnitModel>>> returnContentBySubjectId(
      int subjectId);

  Future<Either<Failure, AllGiftsModel>> getAllGifts();

  Future<Either<Failure, List<GiftByUserIdModel>>> getGiftByUserId();

  Future<Either<Failure, AssignGiftModel>> assignGiftToUser(
      AssignGiftToUserRequest assignGiftToUserRequest);

  Future<Either<Failure, SubmitSingleQuestionModel>>
      submitSingleQuestionHistory(
          SubmitSingleQuestionRequest submitSingleQuestionRequest);

  Future<Either<Failure, SubmitSingleQuestionModel>>
      submitMCQSingleQuestionHistory(
          SubmitMCQSingleQuestionRequest submitSingleQuestionRequest);

  Future<Either<Failure, HelpSupportModel>> getHelpAndSupport();

  Future<Either<Failure, MapModel>> getSubjectMapById(int id);

  Future<Either<Failure, AllEduYearsModel>> getAllEduYears(int stageId);

  Future<Either<Failure, List<AllStagesModel>>> getAllStages(String? lang);

  Future<Either<Failure, SingleQuestionModel>> submitSingleCompleteQuestion(
    CompleteSubmitSingleQuestionRequest completeSubmitSingleQuestionRequest,
  );

  Future<Either<Failure, SingleQuestionHistoryModel>>
      submitSingleCompleteQuestionHistory(
    SubmitSingleQuestionRequest submitSingleQuestionRequest,
  );

  Future<Either<Failure, SingleQuestionModel>> submitSingleContainerQuestion(
    ContainerSubmitSingleQuestionRequest containerSubmitSingleQuestionRequest,
  );

  Future<Either<Failure, SingleQuestionHistoryModel>>
      submitSingleContainerQuestionHistory(
    SubmitSingleQuestionRequest submitSingleQuestionRequest,
  );

  Future<Either<Failure, String>> deleteUser(int userId);

  Future<Either<Failure, AllPaymentMethodsModel>> getAllPaymentMethod();

  Future<Either<Failure, PlansModel>> getAllPaymentPlans();

  Future<Either<Failure, SubmitSingleMatchingQuestionModel>>
      submitSingleMatchingQuestion(
          SubmitMatchingQuestionRequest submitMatchingQuestionRequest);

  Future<Either<Failure, SubmitSingleMatchingQuestionHistoryModel>>
      submitSingleMatchingQuestionHistory(
          SubmitMatchingQuestionRequestHistory
              submitMatchingQuestionRequestHistory);

  Future<Either<Failure, SubmitSingleQVoiceQuestionModel>>
      submitSingleQVoiceQuestion(
          SubmitSingleVoiceQuestionRequest singleVoiceQuestionRequest);

  Future<Either<Failure, SingleQuestionModel>> submitTranslateSingleQuestion(
    SubmitTranslateSingleQuestionRequest submitTranslateSingleQuestionRequest,
  );

  Future<Either<Failure, ChargeAmountModel>> chargeAmount(
      int amount, int eduCompId, int paymentMethodId, int paymentPlanId);

  Future<Either<Failure, CheckEmailAndPhoneModel>> checkMobileAndEmail(
      EmailMobileRequest emailMobileRequest);
}
