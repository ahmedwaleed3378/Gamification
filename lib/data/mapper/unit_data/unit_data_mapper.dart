import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/unit_data/unit_data_response.dart';
import 'package:gamification/domain/model/unit_data/unit_data_model.dart';

extension UnitDataModelMapper on UnitDataModelResponse? {
  UnitDataModelModel toDomain() {
    return UnitDataModelModel(
      this?.type.orEmpty() ?? Constants.empty,
      this?.id.orZero() ?? Constants.zero,
      this?.arName.orEmpty() ?? Constants.empty,
      this?.enName.orEmpty() ?? Constants.empty,
      this?.order.orZero() ?? Constants.zero,
      this?.examTypeId.orZero() ?? Constants.zero,
      this?.periodMinute.orZero() ?? Constants.zero,
      this!.isMandatory ?? false,
      this?.availableDateFrom.orEmpty() ?? Constants.empty,
      this?.availableDateTo.orEmpty() ?? Constants.empty,
      this?.isPublish ?? false,
      this?.fromHour.orEmpty() ?? Constants.empty,
      this?.toHour.orEmpty() ?? Constants.empty,
      this?.percentageToPass.orZero() ?? Constants.zero,
      this?.isComplete ?? false,
      this?.numViews.orZero() ?? Constants.zero,
      this?.attachTypeId.orZero() ?? Constants.zero,
      this?.attachTypeName.orEmpty() ?? Constants.empty,
      this?.fileTypeId.orZero() ?? Constants.zero,
      this?.fileTypeName.orEmpty() ?? Constants.empty,
      this?.attach.orEmpty() ?? Constants.empty,
      this?.isOnline ?? false,
    );
  }
}

extension UnitDataContentMapper on UnitDataContentResponse? {
  UnitDataContentModel toDomain() {
    return UnitDataContentModel(
      this?.unitId.orZero() ?? Constants.zero,
      this?.unitArName.orEmpty() ?? Constants.empty,
      this?.unitEnName.orEmpty() ?? Constants.empty,
      this?.subjectId.orZero() ?? Constants.zero,
      this?.subjectArName.orEmpty() ?? Constants.empty,
      this?.subjectEnName.orEmpty() ?? Constants.empty,
      this!.isMandatory,
      this?.orderNum.orZero() ?? Constants.zero,
      this?.attach.orEmpty() ?? Constants.empty,
    );
  }
}

extension UnitDataMapper on UnitDataResponse? {
  UnitDataModel toDomain() {
    return UnitDataModel(
      this!.unitData.toDomain(),
      this?.model?.map((model) => model.toDomain())
          .cast<UnitDataModelModel>()
          .toList(),
      this?.completePercentageUnit ?? Constants.zeroD,
    );
  }
}
