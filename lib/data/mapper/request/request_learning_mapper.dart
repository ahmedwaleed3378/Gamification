import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/request/learning_request_response.dart';
import 'package:gamification/domain/model/request/request_learning_model.dart';

extension RequestLearningItemsMapper on RequestLearningItemsResponse? {
  RequestLearningItemsModel toDomain() {
    return RequestLearningItemsModel(
      this?.id.orZero() ?? Constants.zero,
      this?.courseArName.orEmpty() ?? Constants.empty,
      this?.courseEnName.orEmpty() ?? Constants.empty,
      this?.status ?? false,
      this?.numberOfDays.orZero() ?? Constants.zero,
      this?.reasonOfRequest.orEmpty() ?? Constants.empty,
    );
  }
}

extension RequestLearningMapper on RequestLearningResponse? {
  RequestLearningModel toDomain() {
    return RequestLearningModel(
      this?.countItems.orZero() ?? Constants.zero,
      this
          ?.requests
          ?.map((request) => request.toDomain())
          .cast<RequestLearningItemsModel>()
          .toList(),
    );
  }
}
