import 'package:dio/dio.dart';
import 'package:gamification/app/app_prefs.dart';
import 'package:gamification/data/data_source/remote_data_source.dart';
import 'package:gamification/data/network/app_api.dart';
import 'package:gamification/data/network/dio_factory.dart';
import 'package:gamification/data/network/network_info.dart';
import 'package:gamification/data/repository/repository_impl.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/added_course_usecase.dart';
import 'package:gamification/domain/usecase/added_request_usecase.dart';
import 'package:gamification/domain/usecase/all_courses_request_usecase.dart';
import 'package:gamification/domain/usecase/assign_gift_touser_usecase.dart';
import 'package:gamification/domain/usecase/charge_amount_usecase.dart';
import 'package:gamification/domain/usecase/check_balance.dart';
import 'package:gamification/domain/usecase/check_mobile_email_usecase.dart';
import 'package:gamification/domain/usecase/delete_usecase.dart';
import 'package:gamification/domain/usecase/get_all_eduyears_id.dart';
import 'package:gamification/domain/usecase/get_all_stages.dart';
import 'package:gamification/domain/usecase/single_question_complete_usecase.dart';
import 'package:gamification/domain/usecase/single_question_container_history_usecase.dart';
import 'package:gamification/domain/usecase/single_question_container_usecase.dart';
import 'package:gamification/domain/usecase/single_question_translate_usecase.dart';
import 'package:gamification/domain/usecase/submit_mcq_single_question_usecase.dart';
import 'package:gamification/domain/usecase/submit_mcq_single_question_history.dart';
import 'package:gamification/domain/usecase/buy_gift_usecase.dart';
import 'package:gamification/domain/usecase/category_subcourse_usecase.dart';
import 'package:gamification/domain/usecase/course_category_usecase.dart';
import 'package:gamification/domain/usecase/course_request_usecase.dart';
import 'package:gamification/domain/usecase/courses_usecase.dart';
import 'package:gamification/domain/usecase/create_viewrow_usecase.dart';
import 'package:gamification/domain/usecase/deleted_course_usecase.dart';
import 'package:gamification/domain/usecase/deleted_request_usecase.dart';
import 'package:gamification/domain/usecase/editProfile_usecase.dart';
import 'package:gamification/domain/usecase/exam_details_usecase.dart';
import 'package:gamification/domain/usecase/exam_result_usecase.dart';
import 'package:gamification/domain/usecase/get_all_gifts.dart';
import 'package:gamification/domain/usecase/get_all_payment_methods.dart';
import 'package:gamification/domain/usecase/get_all_payment_plans.dart';
import 'package:gamification/domain/usecase/get_all_subjects_progress.dart';
import 'package:gamification/domain/usecase/get_gift_byuser_id_usecase.dart';
import 'package:gamification/domain/usecase/get_subject_map_usecase.dart';
import 'package:gamification/domain/usecase/gift_gallery_usecase.dart';
import 'package:gamification/domain/usecase/help_support_usecase.dart';
import 'package:gamification/domain/usecase/increment_row_usecase.dart';
import 'package:gamification/domain/usecase/lecture_parts_usecase.dart';
import 'package:gamification/domain/usecase/login_usecase.dart';
import 'package:gamification/domain/usecase/profile_usecase.dart';
import 'package:gamification/domain/usecase/register_usecase.dart';
import 'package:gamification/domain/usecase/request_teaching_usecase.dart';
import 'package:gamification/domain/usecase/searched_unit_usecase.dart';
import 'package:gamification/domain/usecase/student_rank_usecase.dart';
import 'package:gamification/domain/usecase/sub_course_usecase.dart';
import 'package:gamification/domain/usecase/subject_unit_usecase.dart';
import 'package:gamification/domain/usecase/submit_exam_usecase.dart';
import 'package:gamification/domain/usecase/submit_single_matching_history_usecase.dart';
import 'package:gamification/domain/usecase/submit_single_matching_question_usecase.dart';
import 'package:gamification/domain/usecase/submit_single_question_usecase.dart';
import 'package:gamification/domain/usecase/unit_data_usecase.dart';
import 'package:gamification/domain/usecase/unit_file_usecase.dart';
import 'package:gamification/domain/usecase/user_points_usecase.dart';
import 'package:gamification/presentation/exam/viewmodel/exam_viewmodel.dart';
import 'package:gamification/presentation/home/viewmodel/home_viewmodel.dart';
import 'package:gamification/presentation/lecture_video/viewmodel/lecture_video_viewmodel.dart';
import 'package:gamification/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:gamification/presentation/map/viewmodel/map_viewmodel.dart';
import 'package:gamification/presentation/payment/viewmodel/payment_methods_viewmodel.dart';
import 'package:gamification/presentation/profile/viewmodel/profile_viewmodel.dart';
import 'package:gamification/presentation/progress/viewmodel/all_subjects_progress_viewmodel.dart';
import 'package:gamification/presentation/scoreboard/viewmodel/scoreboard_viewmodel.dart';
import 'package:gamification/presentation/subject/viewmodel/subject_viewmodel.dart';
import 'package:gamification/presentation/subscription/view_model/subscription_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/usecase/get_all_subjects.dart';
import '../domain/usecase/get_streak_usecase.dart';
import '../domain/usecase/subject_progress_details.dart';
import '../domain/usecase/submit_qvoice_question_usecase.dart';
import '../domain/usecase/submit_single_question_history.dart';
import '../presentation/register/viewmodel/register_viewmodel.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  //shared prefs instance
  var sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initSubscriptionModule() {
  if (!GetIt.I.isRegistered<CheckBalanceUseCase>()) {
    instance.registerFactory<CheckBalanceUseCase>(
        () => CheckBalanceUseCase(instance()));

    instance.registerFactory<CheckBalanceViewModel>(() => CheckBalanceViewModel(
          instance(),
        ));
  }
}

initProfileModule() {
  if (!GetIt.I.isRegistered<ProfileUseCase>() &&
      !GetIt.I.isRegistered<EditProfileUseCase>() &&
      !GetIt.I.isRegistered<HelpSupportUseCase>()) {
    instance.registerFactory<ProfileUseCase>(() => ProfileUseCase(instance()));

    instance.registerFactory<EditProfileUseCase>(
        () => EditProfileUseCase(instance()));

    instance.registerFactory<HelpSupportUseCase>(
        () => HelpSupportUseCase(instance()));

    instance.registerFactory<DeleteUseCase>(() => DeleteUseCase(instance()));

    instance.registerFactory<ProfileViewModel>(
      () => ProfileViewModel(
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<GetAllEduYearsIdUseCase>() &&
      !GetIt.I.isRegistered<GetAllStagesUseCase>()) {
    instance.registerFactory<GetAllStagesUseCase>(
        () => GetAllStagesUseCase(instance()));
    instance.registerFactory<GetAllEduYearsIdUseCase>(
        () => GetAllEduYearsIdUseCase(instance()));
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeViewModel>()) {
    instance.registerFactory<CoursesUseCase>(() => CoursesUseCase(instance()));

    instance.registerFactory<UserPointsUseCase>(
        () => UserPointsUseCase(instance()));
    instance
        .registerFactory<GetStreakUseCase>(() => GetStreakUseCase(instance()));

    instance.registerFactory<GiftGalleryUseCase>(
        () => GiftGalleryUseCase(instance()));

    instance.registerFactory<RequestTeachingUseCase>(
        () => RequestTeachingUseCase(instance()));

    instance.registerFactory<AddedRequestUseCase>(
        () => AddedRequestUseCase(instance()));

    instance.registerFactory<DeletedRequestUseCase>(
        () => DeletedRequestUseCase(instance()));

    instance.registerFactory<BuyGiftUseCase>(() => BuyGiftUseCase(instance()));

    instance.registerFactory<CourseRequestUseCase>(
        () => CourseRequestUseCase(instance()));

    instance.registerFactory<AddedCourseUseCase>(
        () => AddedCourseUseCase(instance()));

    instance.registerFactory<DeletedCourseUseCase>(
        () => DeletedCourseUseCase(instance()));

    instance.registerFactory<AllCoursesRequestUseCase>(
        () => AllCoursesRequestUseCase(instance()));

    instance.registerFactory<CourseCategoryUsecase>(
        () => CourseCategoryUsecase(instance()));
    instance.registerFactory<CategorySubCourseUsecase>(
        () => CategorySubCourseUsecase(instance()));

    instance.registerFactory<GetAllGiftsUseCase>(
        () => GetAllGiftsUseCase(instance()));

    instance.registerFactory<GetGiftByUserIdUseCase>(
        () => GetGiftByUserIdUseCase(instance()));

    instance.registerFactory<AssignGiftToUserUseCase>(
        () => AssignGiftToUserUseCase(instance()));
    instance.registerFactory<StudentSubjectsUseCase>(
        () => StudentSubjectsUseCase(instance()));

    instance.registerFactory<HomeViewModel>(() => HomeViewModel(
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),),);
  }
}

initSubjectModule() {
  if (!GetIt.I.isRegistered<SubCourseUseCase>()) {
    instance
        .registerFactory<UnitFileUseCase>(() => UnitFileUseCase(instance()));
    instance.registerFactory<SearchedUnitUseCase>(
        () => SearchedUnitUseCase(instance()));
    instance
        .registerFactory<UnitDataUseCase>(() => UnitDataUseCase(instance()));
    instance
        .registerFactory<SubCourseUseCase>(() => SubCourseUseCase(instance()));
    instance.registerFactory<SubjectUnitUseCase>(
        () => SubjectUnitUseCase(instance()));

    instance.registerFactory<SubjectViewModel>(() => SubjectViewModel(
        instance(), instance(), instance(), instance(), instance()));
  }
}

initLectureVideoModule() {
  if (!GetIt.I.isRegistered<LectureVideoViewModel>()) {
    instance.registerFactory<LecturePartsUseCase>(
        () => LecturePartsUseCase(instance()));
    instance.registerFactory<CreateViewRowUseCase>(
        () => CreateViewRowUseCase(instance()));
    instance.registerFactory<IncrementViewRowUseCase>(
        () => IncrementViewRowUseCase(instance()));

    instance.registerFactory<LectureVideoViewModel>(
        () => LectureVideoViewModel(instance(), instance(), instance()));
  }
}

initExamModule() {
  if (!GetIt.I.isRegistered<ExamViewModel>()) {
    instance.registerFactory<ExamDetailsUseCase>(
        () => ExamDetailsUseCase(instance()));
    instance.registerFactory<ExamResultUseCase>(
        () => ExamResultUseCase(instance()));
    instance.registerFactory<SubmitMCQSingleQuestionExamUseCase>(
        () => SubmitMCQSingleQuestionExamUseCase(instance()));
    instance.registerFactory<SubmitSingleQuestionExamUseCase>(
        () => SubmitSingleQuestionExamUseCase(instance()));
    instance.registerFactory<SubmitExamCase>(() => SubmitExamCase(instance()));

    instance.registerFactory<SubmitMCQSingleQuestionExamHistoryUseCase>(
        () => SubmitMCQSingleQuestionExamHistoryUseCase(instance()));
    instance.registerFactory<SubmitSingleQuestionExamHistoryUseCase>(
        () => SubmitSingleQuestionExamHistoryUseCase(instance()));
    instance.registerFactory<SingleQuestionContainerUseCase>(
        () => SingleQuestionContainerUseCase(instance()));

    instance.registerFactory<SubmitSingleMatchingQuestionExamUseCase>(
        () => SubmitSingleMatchingQuestionExamUseCase(instance()));
    instance.registerFactory<SubmitSingleMatchingQuestionExamHistoryUseCase>(
        () => SubmitSingleMatchingQuestionExamHistoryUseCase(instance()));

    instance.registerFactory<SubmitSingleQVoiceQuestionUseCase>(
        () => SubmitSingleQVoiceQuestionUseCase(instance()));

    instance.registerFactory<SingleQuestionContainerHistoryUseCase>(
        () => SingleQuestionContainerHistoryUseCase(instance()));

    instance.registerFactory<SingleQuestionTranslateUseCase>(
        () => SingleQuestionTranslateUseCase(instance()));

    instance.registerFactory<SingleQuestionCompleteUseCase>(
        () => SingleQuestionCompleteUseCase(instance()));

    instance.registerFactory<ExamViewModel>(() => ExamViewModel(
          instance(),
          instance(),
          instance(),
          instance(),
          instance(),
          instance(),
          instance(),
          instance(),
          instance(),
          instance(),
          instance(),
          instance(),
          instance(),
          instance(),
        ));
  }
}

initMapModule() {
  if (!GetIt.I.isRegistered<MapViewModel>()) {
    instance.registerFactory<GetSubjectMapByIdUseCase>(
        () => GetSubjectMapByIdUseCase(instance()));

    instance.registerFactory<MapViewModel>(() => MapViewModel(instance()));
  }
}

initPaymentModule() {
  if (!GetIt.I.isRegistered<PaymentMethodsViewModel>()) {
    instance.registerFactory<GetAllPaymentMethodsUseCase>(
        () => GetAllPaymentMethodsUseCase(instance()));
    instance.registerFactory<GetAllPaymentPlansUseCase>(
        () => GetAllPaymentPlansUseCase(instance()));

    instance.registerFactory<ChargeAmountUseCase>(
        () => ChargeAmountUseCase(instance()));

    instance.registerFactory<PaymentMethodsViewModel>(
        () => PaymentMethodsViewModel(instance(), instance(), instance()));
  }
}

initScoreBoardModule() {
  if (!GetIt.I.isRegistered<StudentRankUseCase>()) {
    instance.registerFactory<StudentRankUseCase>(
        () => StudentRankUseCase(instance()));
    instance.registerFactory<ScoreBoardViewModel>(
        () => ScoreBoardViewModel(instance()));
  }
}

initSubjectsProgressModule() {
  if (!GetIt.I.isRegistered<SubjectsProgressUseCase>()) {
    instance.registerFactory<SubjectsProgressUseCase>(
        () => SubjectsProgressUseCase(instance()));
    if (!GetIt.I.isRegistered<SubjectProgressDetailsUseCase>()) {
      instance.registerFactory<SubjectProgressDetailsUseCase>(
          () => SubjectProgressDetailsUseCase(instance()));
    }
    instance.registerFactory<SubjectsProgressViewModel>(
        () => SubjectsProgressViewModel(instance(), instance()));
  }
}

initRegisterModule() {
  print('-------------** out register cond');

  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    print('-------------** in register cond');
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
    if (!GetIt.I.isRegistered<GetAllStagesUseCase>()) {
  instance.registerFactory<GetAllStagesUseCase>(
      () => GetAllStagesUseCase(instance()));
}
    if (!GetIt.I.isRegistered<GetAllEduYearsIdUseCase>()) {
  instance.registerFactory<GetAllEduYearsIdUseCase>(
      () => GetAllEduYearsIdUseCase(instance()));
}

    instance.registerFactory<CheckMobileEmailUsecase>(
        () => CheckMobileEmailUsecase(instance()));

   
  } if (!GetIt.I.isRegistered<RegisterViewModel>()) {
   instance.registerFactory<RegisterViewModel>(
        () => RegisterViewModel(
          instance(),
          instance(),
          instance(),
          instance(),
        ),
      );
   }
  
}

resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initLoginModule();
  initHomeModule();
  initExamModule();
  initSubjectModule();
  initLectureVideoModule();
  initMapModule();
  initPaymentModule();
   initRegisterModule();
}

// initSubjecsDetailsProgressModule() {
//   if (!GetIt.I.isRegistered<SubjectProgressDetailsUseCase>()) {
//     instance.registerFactory<SubjectProgressDetailsUseCase>(
//         () => SubjectProgressDetailsUseCase(instance()));
//     instance.registerFactory<SubjectProgressDetailsViewModel>(
//         () => SubjectProgressDetailsViewModel(instance()));
//   }
// }
