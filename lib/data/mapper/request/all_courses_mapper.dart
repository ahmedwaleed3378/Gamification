import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/request/all_courses_response.dart';
import 'package:gamification/domain/model/request/all_courses_model.dart';

extension CoursesRequestItemsMapper on CoursesRequestItemsResponse? {
  CoursesRequestItemsModel toDomain() {
    return CoursesRequestItemsModel(
      this?.id.orZero() ?? Constants.zero,
      this?.courseArName.orEmpty() ?? Constants.empty,
      this?.courseEnName.orEmpty() ?? Constants.empty,
    );
  }
}

extension AllCoursesRequestMapper on AllCoursesRequestResponse? {
  AllCoursesRequestModel toDomain() {
    return AllCoursesRequestModel(
      this?.returnValue.orZero() ?? Constants.zero,
      this
          ?.courses
          ?.map((courses) => courses.toDomain())
          .cast<CoursesRequestItemsModel>()
          .toList(),
    );
  }
}
