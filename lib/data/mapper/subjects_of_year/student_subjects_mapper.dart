import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/domain/model/subjects_of_year/student_subjects.dart';

import '../../../domain/model/header_profile_data/header_profile_data.dart';
import '../../responses/subjects_of_year/subjects_of_year.dart';

extension StudentSubjectsMapper on StudentSubjectsResponse? {
  StudentSubjectsModel toDomain() {
    return StudentSubjectsModel(
        subjectEducationalYears: this
                ?.subjectEducationalYears
                ?.map((student) => student.toDomain())
                .cast<SubjectModel>()
                .toList() ??
            [],
        recentSubjects: this
                ?.recentSubjects
                ?.map((student) => student.toDomain())
                .cast<RecentSubjectsModel>()
                .toList() ??
            [],
        profileData: this!.profileData!.toDomain(),
        isOpen: this?.isOpen ?? false
        );
  }
}

extension HeaderProfileDataMapper on ProfileDataResponse? {
  ProfileDataModel toDomain() {
    return ProfileDataModel(
        this?.userProfilePhoto.orEmpty() ?? Constants.empty,
        this?.loginCounter.orZero() ?? Constants.zero,
        this?.teacherName.orZeroDouble() ?? Constants.zeroD,
        this?.availablePoints.orZeroDouble() ?? Constants.zeroD);
  }
}

extension SubjectMapper on SubjectResponse? {
  SubjectModel toDomain() {
    return SubjectModel(
      subjectId: this?.subjectId?.orZero() ?? Constants.zero,
      eduYearId: this?.eduYearId?.orZero() ?? Constants.zero,
      subjectArName: this?.subjectArName?.orEmpty() ?? Constants.empty,
      eduYearArName: this?.eduYearArName?.orEmpty() ?? Constants.empty,
      subjectEnName: this?.subjectEnName?.orEmpty() ?? Constants.empty,
      eduYearEnName: this?.eduYearEnName?.orEmpty() ?? Constants.empty,
      subjectImage: this?.subjectImage?.orEmpty() ?? Constants.empty,
    );
  }
}

extension RecentSubjectMapper on RecentSubjectsResponse? {
  RecentSubjectsModel toDomain() {
    return RecentSubjectsModel(
        this?.subjectId?.orZero() ?? Constants.zero,
        this?.subjectArName?.orEmpty() ?? Constants.empty,
        this?.subjectEnName?.orEmpty() ?? Constants.empty,
        this?.subjectImage?.orEmpty() ?? Constants.empty,
        this?.userExamNotSolvedCount.orZero() ?? Constants.zero);
  }
}
