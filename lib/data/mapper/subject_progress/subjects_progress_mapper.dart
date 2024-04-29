import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/subject_progress/subjects_progress.dart';
import 'package:gamification/domain/model/subject_progress/subjects_progress.dart';


extension SubjectsProgressMapper on SubjectsProgressResponse? {
SubjectsProgressModel toDomain() {
    return SubjectsProgressModel(
      subjectEducationalYears: this
              ?.subjectEducationalYears
              ?.map((student) => student.toDomain())
              .cast<SubjectProgressModel>()
              .toList() ??
          [],
    );
  }
}





extension SubjectProgressMapper on SubjectProgressResponse? {
  SubjectProgressModel toDomain() {
    return SubjectProgressModel(
        subjectId: this?.subjectId.orZero() ?? Constants.zero,
        eduYearId: this?.eduYearId.orZero() ?? Constants.zero,
        examCount: this?.examCount.orZero() ?? Constants.zero,
        unitCount: this?.unitCount.orZero() ?? Constants.zero,
        progressBar: this?.progressBar.orZero() ?? Constants.zero,
        subjectArName: this?.subjectArName.orEmpty() ?? Constants.empty,
        subjectEnName: this?.subjectEnName.orEmpty() ?? Constants.empty,
        eduYearArName: this?.eduYearArName.orEmpty() ?? Constants.empty,
        eduYearEnName: this?.eduYearEnName.orEmpty() ?? Constants.empty,
        subjectImage: this?.subjectImage.orEmpty() ?? Constants.empty,
        subjectDescription:
            this?.subjectDescription.orEmpty() ?? Constants.empty);
  }
}
