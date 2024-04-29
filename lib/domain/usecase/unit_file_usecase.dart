import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/unit_files/unit_files_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class UnitFileUseCase implements BaseUseCase<int, UnitFileModel> {
  final Repository _repository;

  UnitFileUseCase(this._repository);

  @override
  Future<Either<Failure, UnitFileModel>> execute(int unitId) {
    return _repository.getAllUnitFile(unitId);
  }
}
