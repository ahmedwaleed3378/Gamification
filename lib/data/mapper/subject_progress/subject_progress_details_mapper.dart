import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/domain/model/subject_progress/subject_progress_details.dart';

import '../../responses/subject_progress/subject_progress_details.dart';

extension SubjectProgressIdMapper on SubjectProgressIdResponse? {
  SubjectProgressIdModel toDomain() {
    return SubjectProgressIdModel(
      subjectEducationalYears: this?.subjectEducationalYears.toDomain(),
    );
  }
}

extension SubjectProgressDetailsMapper on SubjectProgressDetailsResponse? {
  SubjectProgressDetailsModel toDomain() {
    return SubjectProgressDetailsModel(
      subjectId: this?.subjectId.orZero() ?? Constants.zero,
      eduYearId: this?.eduYearId.orZero() ?? Constants.zero,
      subjectArName: this?.subjectArName.orEmpty() ?? Constants.empty,
      subjectEnName: this?.subjectEnName.orEmpty() ?? Constants.empty,
      eduYearArName: this?.eduYearArName.orEmpty() ?? Constants.empty,
      eduYearEnName: this?.eduYearEnName.orEmpty() ?? Constants.empty,
      subjectImage: this?.subjectImage.orEmpty() ?? Constants.empty,
      eduUnit: this
              ?.eduUnit
              ?.map((unit) => unit.toDomain())
              .cast<EduUnitModel>()
              .toList() ??
          [],
      studentTotalExperienceOfSubject:
          this?.studentTotalExperienceOfSubject.orZeroDouble() ??
              Constants.zeroD,
      studentTotalPointsOfSubject:
          this?.studentTotalPointsOfSubject.orZeroDouble() ?? Constants.zeroD,
      subjectAverage: this?.subjectAverage.orZeroDouble() ?? Constants.zeroD,
    );
  }
}

extension EduUnitMapper on EduUnitResponse? {
  EduUnitModel toDomain() {
    return EduUnitModel(
        subjectId: this?.subjectId.orZero() ?? Constants.zero,
        unitArName: this?.unitArName.orEmpty() ?? Constants.empty,
        unitEnName: this?.unitEnName.orEmpty() ?? Constants.empty,
        unitImage: this?.unitImage.orEmpty() ?? Constants.empty,
        studentTotalPointsOfUnit:
            this?.studentTotalPointsOfUnit.orZeroDouble() ?? Constants.zeroD,
        studentTotalExperienceOfUnit:
            this?.studentTotalExperienceOfUnit.orZeroDouble() ??
                Constants.zeroD,
        unitAvrege: this?.unitAvrege.orZeroDouble() ?? Constants.zeroD,
        exams: this?.exams == null
            ? []
            : this!
                .exams!
                .map((eduCompId) => eduCompId.toDomain())
                .cast<UnitExamModel>()
                .toList(),
                );
  }
}

extension ExamUnitMapper on ExamResponse? {
  UnitExamModel toDomain() {
    return UnitExamModel(
      this?.examId.orZero() ?? Constants.zero,
      this?.examArName.orEmpty() ?? Constants.empty,
      this?.examEnName.orEmpty() ?? Constants.empty,
      this?.studentTotalPointsOfExam.orZeroDouble() ?? Constants.zeroD,
      this?.studentTotalExperienceOfExam.orZeroDouble() ?? Constants.zeroD,
      this?.examStudentAverageDegree.orZeroDouble() ?? Constants.zeroD,
    );
  }
}
