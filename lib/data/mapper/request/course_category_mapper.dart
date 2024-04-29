import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/request/course_category_response.dart';
import 'package:gamification/domain/model/request/course_category_model.dart';

extension CourseCategoryListMapper on CourseCategoryListResponse? {
  CourseCategoryListModel toDomain() {
    return CourseCategoryListModel(
      this?.id.orZero() ?? Constants.zero,
      this?.arName.orEmpty() ?? Constants.empty,
      this?.enName.orEmpty() ?? Constants.empty,
    );
  }
}

extension CourseCategoryMapper on AllCourseCategoryResponse? {
  CourseCategoryModel toDomain() {
    return CourseCategoryModel(
      this?.returnValue.orZero() ?? Constants.zero,
      this
          ?.courseCategoryList
          ?.map((courses) => courses.toDomain())
          .cast<CourseCategoryListModel>()
          .toList(),
    );
  }
}
