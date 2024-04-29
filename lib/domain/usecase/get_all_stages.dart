import 'package:dartz/dartz.dart';
import 'package:gamification/domain/model/register/register_model.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';

class GetAllStagesUseCase implements BaseUseCase<String, List<AllStagesModel>> {
  final Repository _repository;

  GetAllStagesUseCase(this._repository);

  @override
  Future<Either<Failure, List<AllStagesModel>>> execute(String? lang) {
    return _repository.getAllStages(lang);
  }
}
