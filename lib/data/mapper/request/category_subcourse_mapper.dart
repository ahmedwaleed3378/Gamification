import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/request/category_subcourse_response.dart';
import 'package:gamification/domain/model/request/category_subcourse_model.dart';

extension CategorySubCourseItemsMapper on CategorySubCourseResponse? {
  CategorySubCourseModel toDomain() {
    return CategorySubCourseModel(
      this?.id.orZero() ?? Constants.zero,
      this?.courseArName.orEmpty() ?? Constants.empty,
      this?.courseEnName.orEmpty() ?? Constants.empty,
      this?.approve ?? false,
      this?.hasRequestBefore ?? false,
      this?.attachFile.orEmpty() ?? Constants.empty,
      this?.courseTime.orZero() ?? Constants.zero,
    );
  }
}