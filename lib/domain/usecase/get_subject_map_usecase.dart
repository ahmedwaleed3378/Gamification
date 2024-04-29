import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/map_model/map_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class GetSubjectMapByIdUseCase implements BaseUseCase<int, MapModel> {
  final Repository _repository;

  GetSubjectMapByIdUseCase(this._repository);

  @override
  Future<Either<Failure, MapModel>> execute(int id) {
    return _repository.getSubjectMapById(id);
  }
}
