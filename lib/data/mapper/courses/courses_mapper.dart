import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/mapper/unit_data/unit_data_mapper.dart';
import 'package:gamification/data/responses/course/course_response.dart';
import 'package:gamification/data/responses/course/subject_response.dart';
import 'package:gamification/domain/model/courses/courses_model.dart';
import 'package:gamification/domain/model/courses/subject_model.dart';
import 'package:gamification/domain/model/unit_data/unit_data_model.dart';

extension CourseContentResponseMapper on CourseContentResponse? {
  CourseContentModel toDomain() {
    return CourseContentModel(
      this?.subjectId.orZero() ?? Constants.zero,
      this?.subjectArName.orEmpty() ?? Constants.empty,
      this?.subjectEnName.orEmpty() ?? Constants.empty,
      this?.subjectDescreption.orEmpty() ?? Constants.empty,
      this?.subjectPromoLink.orEmpty() ?? Constants.empty,
      this?.courseCertificate ?? false,
      this?.courseMinutes.orZero() ?? Constants.zero,
      this?.isArabic ?? false,
      this?.isEnglish ?? false,
      this?.diplomaId.orZero() ?? Constants.zero,
      this?.diplomaArName.orEmpty() ?? Constants.empty,
      this?.diplomaEnName.orEmpty() ?? Constants.empty,
      this?.eduCompId.orZero() ?? Constants.zero,
      this?.attachPath.orEmpty() ?? Constants.empty,
      this
          ?.whatYouLearn
          ?.map((e) => e.orEmpty())
          .cast<String>()
          .toList(),
      this?.exams.orZero() ?? Constants.zero,
      this?.files.orZero() ?? Constants.zero,
      this?.teacherArName.orEmpty() ?? Constants.empty,
      this?.subjectUserNumbers.orZero() ?? Constants.zero,
      this?.isCurrent ?? false,
      true,

      /// not mapped from backend
    );
  }
}

extension CourseResponseMapper on CourseMainResponse? {
  CoursesModel toDomain() {
    return CoursesModel(
      this
          ?.basicCoursesList
          ?.map((basicCourse) => basicCourse.toDomain())
          .cast<CourseContentModel>()
          .toList(),
      this
          ?.recommendedCoursesList
          ?.map((recommendCourse) => recommendCourse.toDomain())
          .cast<CourseContentModel>()
          .toList(),
    );
  }
}

extension SubjectResponseMapper on SubjectUnitResponse? {
  SubjectUnitModel toDomain() {
    return SubjectUnitModel(
        this?.unitId.orZero() ?? Constants.zero,
        this?.subjectId.orZero() ?? Constants.zero,
        this?.unitArName.orEmpty() ?? Constants.empty,
        this?.unitEnName.orEmpty() ?? Constants.empty,
        this?.subjectArName.orEmpty() ?? Constants.empty,
        this?.subjectEnName.orEmpty() ?? Constants.empty,
        this
            ?.content
            ?.map((model) => model.toDomain())
            .cast<UnitDataModelModel>()
            .toList(),
        this?.orderNum.orZero() ?? Constants.zero,
        this?.isMandatory ?? false);
  }
}
