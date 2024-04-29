
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:gamification/app/app_prefs.dart';
import 'package:gamification/data/data_source/remote_data_source.dart';
import 'package:gamification/data/mapper/check_balance_mapper/check_balance_mapper.dart';
import 'package:gamification/data/mapper/courses/courses_mapper.dart';
import 'package:gamification/data/mapper/editProfile/edit_profile.dart';
import 'package:gamification/data/mapper/exam/exam_details_mapper.dart';
import 'package:gamification/data/mapper/exam/exam_result.dart';
import 'package:gamification/data/mapper/exam/submit_exam.dart';
import 'package:gamification/data/mapper/exam/submit_single_question.dart';
import 'package:gamification/data/mapper/gift_gallery/all_gifts_mapper.dart';
import 'package:gamification/data/mapper/gift_gallery/buy_gift_mapper.dart';
import 'package:gamification/data/mapper/gift_gallery/gift_by_user_id.dart';
import 'package:gamification/data/mapper/gift_gallery/gift_gallery_mapper.dart';
import 'package:gamification/data/mapper/help_support/help_support_mapper.dart';
import 'package:gamification/data/mapper/lecture_parts/lecture_parts_mapper.dart';
import 'package:gamification/data/mapper/login/login_mapper.dart';
import 'package:gamification/data/mapper/map_mapper/map_mapper.dart';
import 'package:gamification/data/mapper/payment_mapper/charge_amount_mapper.dart';
import 'package:gamification/data/mapper/payment_mapper/payment_mapper.dart';
import 'package:gamification/data/mapper/payment_mapper/plans_mapper.dart';
import 'package:gamification/data/mapper/profile/profile_mapper.dart';
import 'package:gamification/data/mapper/question/single_question_history_mapper.dart';
import 'package:gamification/data/mapper/question/single_question_mapper.dart';
import 'package:gamification/data/mapper/register/register_mapper.dart';
import 'package:gamification/data/mapper/request/all_courses_mapper.dart';
import 'package:gamification/data/mapper/request/category_subcourse_mapper.dart';
import 'package:gamification/data/mapper/request/course_category_mapper.dart';
import 'package:gamification/data/mapper/request/request_learning_mapper.dart';
import 'package:gamification/data/mapper/request/request_teaching_mapper.dart';
import 'package:gamification/data/mapper/request/success_request_mapper.dart';
import 'package:gamification/data/mapper/searched_units/searched_units_mapper.dart';
import 'package:gamification/data/mapper/streak_mapper/streak_mapper.dart';
import 'package:gamification/data/mapper/student_rank/student_rank_mapper.dart';
import 'package:gamification/data/mapper/sub_course/sub_course_mapper.dart';
import 'package:gamification/data/mapper/subject_progress/subject_progress_details_mapper.dart';
import 'package:gamification/data/mapper/subject_progress/subjects_progress_mapper.dart';
import 'package:gamification/data/mapper/subjects_of_year/student_subjects_mapper.dart';
import 'package:gamification/data/mapper/unit_data/unit_data_mapper.dart';
import 'package:gamification/data/mapper/unit_files/unit_files_mapper.dart';
import 'package:gamification/data/mapper/user_points/user_points_mapper.dart';
import 'package:gamification/data/network/error_handler.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/data/network/network_info.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/check_balance/check_balance.dart';
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
import 'package:gamification/domain/model/streakModel/streak_model.dart';
import 'package:gamification/domain/model/student_rank/student_rank_model.dart';
import 'package:gamification/domain/model/sub_course/sub_course_model.dart';
import 'package:gamification/domain/model/subject_progress/subject_progress_details.dart';
import 'package:gamification/domain/model/subject_progress/subjects_progress.dart';
import 'package:gamification/domain/model/subjects_of_year/student_subjects.dart';
import 'package:gamification/domain/model/unit_data/unit_data_model.dart';
import 'package:gamification/domain/model/unit_files/unit_files_model.dart';
import 'package:gamification/domain/model/user_points/user_points_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/generated/locale_keys.g.dart';

import '../../app/di.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        // its connected to internet, its safe to call API
        final response = await _remoteDataSource.login(loginRequest);
        if (response.returnValue == 0) {
          // success return data
          return Right(response.toDomain());
        } else {
          // failure --return business error
          return Left(Failure(ResponseCode.UNAUTHORIZED,
              response.returnString ?? LocaleKeys.UNAUTHORIZED.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> returnProfile() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.returnProfile();
        if (response.user != null) {
          return Right(response.toDomain());
        } else {
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, EditProfileModel>> editProfile(
      EditProfileRequest editProfileRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        final response =
            await _remoteDataSource.editProfile(editProfileRequest);
        if (response.returnValue == 1) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.returnValue ?? ResponseCode.NO_CONTENT,
              response.returnMsg ?? LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, CoursesModel>> getBasicRecommendedCourses() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getBasicRecommendedCourses();
        if (response.basicCoursesList!.isNotEmpty ||
            response.recommendedCoursesList!.isNotEmpty) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, UserPointsModel>> getPointsOfUser() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getPointsOfUser();

        if (response.allPoints != 0.0) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, GiftGalleryModel>> getGiftGallery() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getGiftGallery();

        if (response.giftGallery!.isNotEmpty) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ExamDetailsModel>> examDetails(int examId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.examDetails(examId);
        print('muuuuu');
        if (response.returnValue == ResponseCode.SUCCESS) {
          print('not muuuuu');
          return Right(response.toDomain());
        } else {
          print('not muuuuu2');

          return Left(Failure(response.returnValue ?? ResponseCode.NO_CONTENT,
              LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        print('not muuuuu error');
        print(error);

        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SubmitSingleQuestionModel>> submitSingleQuestion(
      SubmitSingleQuestionRequest submitSingleQuestionRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource
            .submitSingleQuestion(submitSingleQuestionRequest);
        if (response.returnValue == ResponseCode.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.returnValue ?? ResponseCode.NO_CONTENT,
              LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        print(error);
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SubmitExamModel>> submitExam(
      SubmitExamRequest submitExamRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.submitExam(submitExamRequest);
        if (response.returnString != 'Exam already solved') {
          return Right(response.toDomain());
        } else {
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ExamResultModel>> examResults(int examId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.examResults(examId);
        print(response);
        print('fff');
        if (response.ex != null) {
          print('ffff1');
          return Right(response.toDomain());
          // return Right(response.toDomain());
        } else {
          print('ffff2');
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        print('ffff3');
        print(error);
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, RequestTeachingModel>> getAllTeachingCourseRequests(
      int pageId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response =
            await _remoteDataSource.getAllTeachingCourseRequests(pageId);

        if (response.requests!.isNotEmpty) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SuccessRequestModel>> addTeachingRequest(
    AddTeachingRequest addTeachingRequest,
  ) async {
    if (await _networkInfo.isConnect) {
      try {
        final response =
            await _remoteDataSource.addTeachingRequest(addTeachingRequest);
        if (response.returnValue != 0) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.returnValue ?? ResponseCode.NO_CONTENT,
              response.returnString ?? LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SuccessRequestModel>> deleteTeachingRequest(
      int requestId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response =
            await _remoteDataSource.deleteTeachingRequest(requestId);
        if (response.returnValue != 0) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.returnValue ?? ResponseCode.NO_CONTENT,
              response.returnString ?? LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, BuyGiftModel>> buyGift(int giftId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.buyGift(giftId);
        if (response.returnValue != 0) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.returnValue ?? ResponseCode.NO_CONTENT,
              LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, RequestLearningModel>> getAllCourseRequests(
      int pageId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getAllCourseRequests(pageId);

        if (response.requests!.isNotEmpty) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SuccessRequestModel>> addCourseRequest(
      AddCourseRequest addCourseRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        debugPrint('in call function');
        debugPrint(addCourseRequest.numberOfDays.toString());
        debugPrint(addCourseRequest.reasonOfRequest);
        debugPrint(addCourseRequest.courseId.toString());
        final response =
            await _remoteDataSource.addCourseRequest(addCourseRequest);
        if (response.returnValue != 0) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            response.returnValue ?? ResponseCode.NO_CONTENT,
            response.returnString ?? LocaleKeys.NO_CONTENT.tr(),
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SuccessRequestModel>> deleteCourseRequest(
      int requestId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.deleteCourseRequest(requestId);
        if (response.returnValue != 0) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            response.returnValue ?? ResponseCode.NO_CONTENT,
            response.returnString ?? LocaleKeys.NO_CONTENT.tr(),
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, AllCoursesRequestModel>> getAllCoursesRequest() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getAllCoursesRequest();

        if (response.courses!.isNotEmpty) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, UnitDataModel>> getAllUnitDate(int unitId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getAllUnitDate(unitId);

        debugPrint('response');
        debugPrint(response.unitData.toString());

        if (response.unitData != null) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        debugPrint('============ $error');
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SubCourseModel>> getSubCourseById(int courseId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getSubCourseById(courseId);

        if (response.subCourseArName!.isNotEmpty) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<SearchedUnitModel>>>
      returnSearchedUnitsBySubjectId(int subjectId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response =
            await _remoteDataSource.returnSearchedUnitsBySubjectId(subjectId);

        if (response.isNotEmpty) {
          return Right((response.map((unit) => unit.toDomain()))
              .cast<SearchedUnitModel>()
              .toList());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, UnitFileModel>> getAllUnitFile(int unitId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getAllUnitFile(unitId);

        if (response.unitData!.isNotEmpty) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, CourseCategoryModel>> getAllRequestCategories() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getAllRequestCategories();

        if (response.courseCategoryList!.isNotEmpty) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<CategorySubCourseModel>>>
      getSubCourseByCategoryId(int categoryId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response =
            await _remoteDataSource.getSubCourseByCategoryId(categoryId);
        // as List<CategorySubCourseModel>;

        if (response.isNotEmpty) {
          return Right(response
              .map((course) => course.toDomain())
              .cast<CategorySubCourseModel>()
              .toList());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, LecturePartsModel>> getLessonPartsAndExams(
      int lessonId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response =
            await _remoteDataSource.getLessonPartsAndExams(lessonId);

        if (response.model!.isMaterialAvaliable == false) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SuccessRequestModel>> createViewRow(
      int materialId, int partId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response =
            await _remoteDataSource.createViewRow(materialId, partId);

        if (response.returnValue != 0) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SuccessRequestModel>> incrementView(
      int materialId, int partId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response =
            await _remoteDataSource.incrementView(materialId, partId);

        if (response.returnValue != 0) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<SubjectUnitModel>>> returnContentBySubjectId(
      int subjectId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response =
            await _remoteDataSource.returnContentBySubjectId(subjectId);

        if (response.isNotEmpty) {
          return Right(response
              .map((course) => course.toDomain())
              .cast<SubjectUnitModel>()
              .toList());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, StudentRankModel>> getStudentRank() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getStudentRank();
        print('dauratioooon');
        print(response.resetMinutes);
        print(response.resetHours);
        print(response.resetDays);
        print(response.resetSeconds);
        print('dauratioooon');
        for (String str in response!.instructions!) {
          print(str);
        }
        if (response.mylogginStudentShortList != null) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, HelpSupportModel>> getHelpAndSupport() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getHelpAndSupport();

        if (response.commonQuestionsContent!.isNotEmpty) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        // its connected to internet, its safe to call API
        final response = await _remoteDataSource.register(registerRequest);
        if (response.returnValue == 1) {
          // success return data
          return Right(response.toDomain());
        } else {
          // failure --return business error
          return Left(
            Failure(
              ResponseCode.UNAUTHORIZED,
              response.returnString ?? LocaleKeys.UNAUTHORIZED.tr(),
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, AllGiftsModel>> getAllGifts() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getAllGifts();
        if (response != null) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<GiftByUserIdModel>>> getGiftByUserId() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getGiftByUserId();

        if (response.isNotEmpty) {
          return Right(response
              .map((course) => course.toDomain())
              .cast<GiftByUserIdModel>()
              .toList());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, AssignGiftModel>> assignGiftToUser(
      AssignGiftToUserRequest assignGiftToUserRequest) async {
    AppPreferences appPreferences = instance<AppPreferences>();
    String lang = await appPreferences.getAppLanguage();
    if (await _networkInfo.isConnect) {
      try {
        final response =
            await _remoteDataSource.assignGiftToUser(assignGiftToUserRequest);
        if (response.returnValue == 1) {
          return Right(response.toDomain());
        } else {
          if (lang == 'ar') {
          
            return Left(
              Failure(
                  ResponseCode.NO_CONTENT,
                  response.returnMessage == null
                      ? LocaleKeys.NO_CONTENT.tr()
                      : 'ليس لديك رصيد كافي من النقاط لشراء الهدية'),
            );
          } else {
        
            return Left(
              Failure(ResponseCode.NO_CONTENT,
                  response.returnMessage ?? LocaleKeys.NO_CONTENT.tr()),
            );
          }
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SubmitSingleQuestionModel>>
      submitSingleQuestionHistory(
          SubmitSingleQuestionRequest submitSingleQuestionRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource
            .submitSingleQuestionHistory(submitSingleQuestionRequest);
        if (response.returnValue == ResponseCode.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.returnValue ?? ResponseCode.NO_CONTENT,
              LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, StudentSubjectsModel>> getAllSubjects() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getAllSubjects();
        if (response.subjectEducationalYears != null) {
          return Right(response.toDomain());
        } else {
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, MapModel>> getSubjectMapById(int id) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getSubjectMapById(id);
        if (response.subjectMapResponse != null) {
          return Right(response.toDomain());
        } else {
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SubjectsProgressModel>>
      getAllSubjectsProgress() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getAllSubjectsProgress();
        if (response.subjectEducationalYears != null) {
          return Right(response.toDomain());
        } else {
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SubjectProgressIdModel>> subjectProgressDetails(
      int id) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.subjectProgressDetails(id);
        if (response.subjectEducationalYears != null) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              ResponseCode.NO_CONTENT,
              LocaleKeys.NO_CONTENT.tr(),
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SingleQuestionModel>> submitSingleCompleteQuestion(
    CompleteSubmitSingleQuestionRequest completeSubmitSingleQuestionRequest,
  ) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.submitSingleCompleteQuestion(
          completeSubmitSingleQuestionRequest,
        );
        if (response.returnValue != null) {
          return Right(response.toDomain());
        } else {
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SingleQuestionHistoryModel>>
      submitSingleCompleteQuestionHistory(
    SubmitSingleQuestionRequest submitSingleQuestionRequest,
  ) async {
    if (await _networkInfo.isConnect) {
      try {
        final response =
            await _remoteDataSource.submitSingleCompleteQuestionHistory(
          submitSingleQuestionRequest,
        );
        if (response.returnValue != null) {
          return Right(response.toDomain());
        } else {
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SingleQuestionModel>> submitSingleContainerQuestion(
    ContainerSubmitSingleQuestionRequest containerSubmitSingleQuestionRequest,
  ) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.submitSingleContainerQuestion(
          containerSubmitSingleQuestionRequest,
        );
        if (response.returnValue != null) {
          return Right(response.toDomain());
        } else {
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SingleQuestionHistoryModel>>
      submitSingleContainerQuestionHistory(
    SubmitSingleQuestionRequest submitSingleQuestionRequest,
  ) async {
    if (await _networkInfo.isConnect) {
      try {
        final response =
            await _remoteDataSource.submitSingleContainerQuestionHistory(
          submitSingleQuestionRequest,
        );
        if (response.returnValue != null) {
          return Right(response.toDomain());
        } else {
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteUser(int userId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.deleteUser(
          userId,
        );

        if (ResponseCode.SUCCESS == 200) {
          return Right(response);
        } else {
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, AllPaymentMethodsModel>> getAllPaymentMethod() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getAllPaymentMethod();
        if (response.paymentMethods!.isNotEmpty) {
          return Right(response.toDomain());
        } else {
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, PlansModel>> getAllPaymentPlans() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getAllPaymentPlans();

        if (response.paymentPlans! != null) {
          return Right(response.toDomain());
        } else {
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SubmitSingleQuestionModel>> submitMCQSingleQuestion(
      SubmitMCQSingleQuestionRequest submitSingleQuestionRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource
            .submitMCQSingleQuestion(submitSingleQuestionRequest);

        if (response.returnValue == 200) {
          return Right(response.toDomain());
        } else {
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SubmitSingleQuestionModel>>
      submitMCQSingleQuestionHistory(
          SubmitMCQSingleQuestionRequest submitSingleQuestionRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.submitMCQSingleQuestionHistory(
          submitSingleQuestionRequest,
        );
        if (response.returnValue != null) {
          return Right(response.toDomain());
        } else {
          // log(message)
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SubmitSingleMatchingQuestionModel>>
      submitSingleMatchingQuestion(
          SubmitMatchingQuestionRequest submitMatchingQuestionRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource
            .submitSingleMatchingQuestion(submitMatchingQuestionRequest);
        if (response.returnValue == 200) {
          return Right(response.toDomain());
        } else {
          // log(message)
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SubmitSingleMatchingQuestionHistoryModel>>
      submitSingleMatchingQuestionHistory(
          SubmitMatchingQuestionRequestHistory
              submitMatchingQuestionRequestHistory) async {
    if (await _networkInfo.isConnect) {
      try {
        final response =
            await _remoteDataSource.submitSingleMatchingQuestionHistory(
                submitMatchingQuestionRequestHistory);
        if (response.returnValue == 200) {
          return Right(response.toDomain());
        } else {
          // log(message)
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SubmitSingleQVoiceQuestionModel>>
      submitSingleQVoiceQuestion(
          SubmitSingleVoiceQuestionRequest singleVoiceQuestionRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource
            .submitSingleQVoiceQuestion(singleVoiceQuestionRequest);
        if (response.returnValue == 200) {
          return Right(response.toDomain());
        } else {
          // log(message)
          return Left(
              Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SingleQuestionModel>> submitTranslateSingleQuestion(
    SubmitTranslateSingleQuestionRequest submitTranslateSingleQuestionRequest,
  ) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.submitTranslateSingleQuestion(
            submitTranslateSingleQuestionRequest);
        if (response.returnValue == 200) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, AllEduYearsModel>> getAllEduYears(int stageId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getAllEduYearsId(stageId);
        if (response.eduYears != null) {
          return Right(
            response.toDomain(),
          );
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<AllStagesModel>>> getAllStages(
      String? lang) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getAllStages(lang);
        if (response != null) {
          return Right(response
              .map((course) => course.toDomain())
              .cast<AllStagesModel>()
              .toList());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ChargeAmountModel>> chargeAmount(
      int amount, int eduCompId, int paymentMethodId, int paymentPlanId) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.chargeAmount(
            amount, eduCompId, paymentMethodId, paymentPlanId);
        if (response != null) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, CheckBalanceModel>> checkBalance() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.checkBalance();

        if (response.userBalanceList != null) {
          return Right(
            response.toDomain(),
          );
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, CheckEmailAndPhoneModel>> checkMobileAndEmail(
      EmailMobileRequest emailMobileRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        final response =
            await _remoteDataSource.checkMobileAndEmail(emailMobileRequest);
        if (response != null) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, StreakModel>> getUserStreak() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteDataSource.getUesrStreak();

        if (response.streakeCounter != null) {
          return Right(
            response.toDomain(),
          );
        } else {
          return Left(
            Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr()),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  
}
