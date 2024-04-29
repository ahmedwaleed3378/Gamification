import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/unit_data/unit_data_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class UnitDataUseCase implements BaseUseCase<int, UnitDataModel> {
  final Repository _repository;

  UnitDataUseCase(this._repository);

  @override
  Future<Either<Failure, UnitDataModel>> execute(int unitId) {
    return _repository.getAllUnitDate(unitId);
  }
}
