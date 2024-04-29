import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/user_points/user_points_response.dart';
import 'package:gamification/domain/model/user_points/user_points_model.dart';

extension RegisterMapper on UserPointsResponse? {
  UserPointsModel toDomain() {
    return UserPointsModel(
      this?.allPoints.orZeroDouble() ?? Constants.zeroD,
      this?.usedPoints.orZeroDouble() ?? Constants.zeroD,
      this?.unUsedPoints.orZeroDouble() ?? Constants.zeroD,
    );
  }
}
