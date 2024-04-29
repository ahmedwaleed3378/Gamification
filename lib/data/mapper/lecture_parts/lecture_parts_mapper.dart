import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/lecture_parts/lecture_parts_response.dart';
import 'package:gamification/domain/model/lecture_parts/lecture_parts_model.dart';

extension MaterialMapper on MaterialResponse? {
  MaterialModel toDomain() {
    return MaterialModel(
      this?.id.orZero() ?? Constants.zero,
      // this?.userID.orZero() ?? Constants.zero,
      // this?.numViews.orZero() ?? Constants.zero,
      // this?.attachPath.orEmpty() ?? Constants.empty,
      // this?.subjectID.orZero() ?? Constants.zero,
      // this?.orderNum.orZero() ?? Constants.zero,
      this?.isMandatory ?? false,
      this?.state ?? false,
      // this?.isOnline ?? false,
      // this?.isActive ?? false,
      this?.materialName.orEmpty() ?? Constants.empty,
      this?.isAvaliable ?? false,
      // this?.quizCount.orZero() ?? Constants.zero,
      // this?.notsolvedQuizCount.orZero() ?? Constants.zero,
    );
  }
}

extension PartsMapper on PartsResponse? {
  PartsModel toDomain() {
    return PartsModel(
      this?.id.orZero() ?? Constants.zero,
      this?.materialId.orZero() ?? Constants.zero,
      this?.name.orEmpty() ?? Constants.empty,
      this?.path.orEmpty() ?? Constants.empty,
      this?.secondaryPath.orEmpty() ?? Constants.empty,
      this?.viewsLimit.orZero() ?? Constants.zero,
      this?.canStudentWatch ?? false,
      this?.viewPercentage.orZero() ?? Constants.zero,
      this?.videoTypeId.orZero() ?? Constants.zero,
      this?.token.orEmpty() ?? Constants.empty,
      this?.vimeoID.orEmpty() ?? Constants.empty,
      this?.isVimeo ?? false,
      this?.isComplete ?? false,
      this?.state ?? false,
    );
  }
}

extension NextMapper on NextResponse? {
  NextModel toDomain() {
    return NextModel(
      this?.type.orEmpty() ?? Constants.empty,
      this?.id.orZero() ?? Constants.zero,
      this?.order.orZero() ?? Constants.zero,
    );
  }
}

extension ModelMapper on ModelResponse? {
  ModelModel toDomain() {
    return ModelModel(
      this?.material.toDomain(),
      this?.isMaterialAvaliable ?? false,
      this?.parts?.map((next) => next.toDomain()).cast<PartsModel>().toList(),
      this?.userID.orZero() ?? Constants.zero,
      this?.examsSolved ?? false,
    );
  }
}

extension LecturePartsMapper on LecturePartsResponse? {
  LecturePartsModel toDomain() {
    return LecturePartsModel(
      this?.model.toDomain(),
      // this
      //     ?.previous
      //     ?.map((previous) => previous.toDomain())
      //     .cast<dynamic>()
      //     .toList(),
      // this?.next?.map((next) => next.toDomain()).cast<NextModel>().toList(),
    );
  }
}
