import 'package:gamification/app/constants.dart';
import 'package:gamification/data/responses/map/map_response.dart';
import 'package:gamification/domain/model/map_model/map_model.dart';
import 'package:gamification/app/extension.dart';

extension MapResponseMapper on MapResponse? {
  MapModel toDomain() {
    return MapModel(this!.subjectMapResponse.toDomain());
  }
}

extension SubjectMapResponseMapper on SubjectMapResponse? {
  SubjectMapModel toDomain() {
    return SubjectMapModel(
      subjectId: this?.subjectId.orZero() ?? Constants.zero,
      subjectArMame: this?.subjectArMame.orEmpty() ?? Constants.empty,
      subjectEnName: this?.subjectEnName.orEmpty() ?? Constants.empty,
      eduYearId: this?.eduYearId.orZero() ?? Constants.zero,
      eduYearArName: this?.eduYearArName.orEmpty() ?? Constants.empty,
      eduYearEnName: this?.eduYearEnName.orEmpty() ?? Constants.empty,
      subjectImage: this?.subjectImage.orEmpty() ?? Constants.empty,
      examsModel: this?.subjectExams == null
          ? []
          : this!
              .subjectExams!
              .map((exam) => exam.toDomain())
              .cast<SubjectExamsModel>()
              .toList(),
      eduUnitModel: this?.eduUnitResponse == null
          ? []
          : this!
              .eduUnitResponse!
              .map((exam) => exam.toDomain())
              .cast<EduUnitModel>()
              .toList(),
    );
  }
}

extension EduUnitResponseMapper on EduUnitResponse? {
  EduUnitModel toDomain() {
    return EduUnitModel(
      unitId: this?.unitId.orZero() ?? Constants.zero,
      unitArName: this?.unitArName.orEmpty() ?? Constants.empty,
      unitEnName: this?.unitEnName.orEmpty() ?? Constants.empty,
      unitImage: this?.unitImage.orEmpty() ?? Constants.empty,
      unitExams: this?.unitExams == null
          ? []
          : this!
              .unitExams!
              .map((exam) => exam.toDomain())
              .cast<SubjectExamsModel>()
              .toList(),
    );
  }
}

extension SubjectExamsResponseModel on SubjectExamsResponse? {
  SubjectExamsModel toDomain() {
    return SubjectExamsModel(
      this?.examId.orZero() ?? Constants.zero,
      this?.examArName.orEmpty() ?? Constants.empty,
      this?.examEnName.orEmpty() ?? Constants.empty,
      this?.isCompleted ?? false,
      this?.notResolved ?? false,
      this?.examTime.orZero() ?? Constants.zero,
      this?.totalResult.orZeroDouble() ?? Constants.zeroD,
      this?.userExamExperince.orZeroDouble() ?? Constants.zeroD,
      this?.userExamPoint.orZeroDouble() ?? Constants.zeroD,
      this?.examMark.orZeroDouble() ?? Constants.zeroD,
      this?.examExperience.orZeroDouble() ?? Constants.zeroD,
    );
  }
}
