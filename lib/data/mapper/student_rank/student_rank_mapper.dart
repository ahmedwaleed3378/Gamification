import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/student_rank/student_rank_response.dart';
import 'package:gamification/domain/model/student_rank/student_rank_model.dart';

import '../../../app/constants.dart';

extension StudentRankMapper on StudentRankResponse? {
  StudentRankModel toDomain() {
    return StudentRankModel(
        top3Students: this
                ?.top3Students
                ?.map((student) => student.toDomain())
                .cast<StudentModel>()
                .toList() ??
            [],
        mylogginStudentShortList: this
                ?.mylogginStudentShortList
                ?.map((student) => student.toDomain())
                .cast<StudentModel>()
                .toList() ??
            [],
        studentsRankList: this
                ?.studentsRankList
                ?.map((student) => student.toDomain())
                .cast<StudentModel>()
                .toList() ??
            [],
    resetDays:      this?.resetDays.orZero() ?? Constants.zero,
      resetHours:      this?.resetHours.orZero() ?? Constants.zero,
      resetMinutes:      this?.resetMinutes.orZero() ?? Constants.zero,
      resetSeconds:     this?.resetSeconds.orZero() ?? Constants.zero,
      instructions:this?.instructions == null?[]: this!.instructions!.map((e) => e.orEmpty() ?? Constants.empty).cast<String>().toList(),
  
      );
  }
}

extension StudentResponseMapper on StudentResponse? {
  StudentModel toDomain() {
    return StudentModel(
        userId: this?.userId.orZero() ?? Constants.zero,
        totalPoints: this?.totalPoints ?? Constants.zero.toDouble(),
        arName: this?.arName.orEmpty() ?? Constants.empty,
        userProfile:this?.userProfile.orEmpty()?? Constants.empty ,  userRank: this?.userRank.orZero() ?? Constants.zero,);
  }
}
