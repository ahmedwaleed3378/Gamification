import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/unit_files/unit_files_response.dart';
import 'package:gamification/domain/model/unit_files/unit_files_model.dart';

extension UnitFileDataMapper on UnitFileDataResponse? {
  UnitFileDataModel toDomain() {
    return UnitFileDataModel(
      this?.id.orZero() ?? Constants.zero,
      this?.arName.orEmpty() ?? Constants.empty,
      this?.enName.orEmpty() ?? Constants.empty,
      this?.order.orZero() ?? Constants.zero,
      this?.subjectId.orZero() ?? Constants.zero,
      this?.subjectArName.orEmpty() ?? Constants.empty,
      this?.subjectEnName.orEmpty() ?? Constants.empty,
      this?.isMandatory ?? false,
      this?.attach.orEmpty() ?? Constants.empty,
      this
          ?.fileEduUnit
          ?.map((file) => file.toDomain())
          .cast<dynamic>()
          .toList(),
    );
  }
}

extension UnitFileMapper on UnitFileResponse? {
  UnitFileModel toDomain() {
    return UnitFileModel(
      this
          ?.unitData
          ?.map((data) => data.toDomain())
          .cast<UnitFileDataModel>()
          .toList(),
    );
  }
}
