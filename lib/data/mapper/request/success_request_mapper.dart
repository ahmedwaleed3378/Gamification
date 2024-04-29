import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/request/success_request_response.dart';
import 'package:gamification/domain/model/request/success_request_model.dart';

extension SuccessRequestMapper on SuccessRequestResponse? {
  SuccessRequestModel toDomain() {
    return SuccessRequestModel(
      this?.returnValue.orZero() ?? Constants.zero,
      this?.returnString.orEmpty() ?? Constants.empty,
    );
  }
}