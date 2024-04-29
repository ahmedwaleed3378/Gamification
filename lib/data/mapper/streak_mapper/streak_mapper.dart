import 'package:gamification/app/extension.dart';

import '../../../app/constants.dart';
import '../../../domain/model/streakModel/streak_model.dart';
import '../../responses/streak_response/streak_response.dart';

extension StreakMapper on StreakResponse? {
  StreakModel toDomain() {
    return StreakModel(
      counter: this?.counter.orZero() ?? Constants.zero,
      streakCounter: this?.streakeCounter.orZero() ?? Constants.zero,
    );
  }
}
