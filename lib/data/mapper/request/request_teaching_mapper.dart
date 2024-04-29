import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/request/teaching_request_response.dart';
import 'package:gamification/domain/model/request/request_teaching_model.dart';

extension RequestTeachingItemsMapper on RequestTeachingItemsResponse? {
  RequestTeachingItemsModel toDomain() {
    return RequestTeachingItemsModel(
      this?.id.orZero() ?? Constants.zero,
      this?.employeeName.orEmpty() ?? Constants.empty,
      this?.courseArName.orEmpty() ?? Constants.empty,
      this?.courseEnName.orEmpty() ?? Constants.empty,
      this?.status ?? false,
      this?.numberOfDays.orZero() ?? Constants.zero,
      this?.details.orEmpty() ?? Constants.empty,
    );
  }
}

extension RequestTeachingMapper on RequestTeachingResponse? {
  RequestTeachingModel toDomain() {
    return RequestTeachingModel(
      this?.countItems.orZero() ?? Constants.zero,
      this
          ?.requests
          ?.map((request) => request.toDomain())
          .cast<RequestTeachingItemsModel>()
          .toList(),
    );
  }
}
