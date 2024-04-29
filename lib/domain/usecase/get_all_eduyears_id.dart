import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/register/register_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class GetAllEduYearsIdUseCase implements BaseUseCase<int, AllEduYearsModel> {
  final Repository _repository;

  GetAllEduYearsIdUseCase(this._repository);

  @override
  Future<Either<Failure, AllEduYearsModel>> execute(int id) {
    return _repository.getAllEduYears(id);
  }
}
